class ActivitiesController < ApplicationController
  # GET /activities
  # GET /activities.json
  def index
    if params[:index]=='tag'
      
      @activities = Activity.find_by_sql(["select * from activities where id in (select activity_id from user_follow_tags,activity_tags where user_follow_tags.user_id=? and user_follow_tags.follow_id=activity_tags.tag_id) order by created_at DESC;",session[:current_user_id]])
    end
    if params[:index]=='location'
      @activities=Activity.find_by_sql(["select * from activities where location_id in (select follow_id from user_follow_locations where user_id=?) order by created_at DESC;",session[:current_user_id]])
    end
    if params[:index]=='user'
      @activities=Activity.find_by_sql(["select * from activities where user_id in (select follow_id from user_follow_users where user_id=?) order by created_at DESC;",session[:current_user_id]])
    end
    if params[:index]=='timemachine'
      @activities=Activity.find_by_sql(["select activities.* from activities,locations where (locations.id=? or locations.uptree like ?) and locations.id=activities.location_id and starttime>? and starttime<? order by created_at",params[:location_id],"%#{params[:location_id]}%",params[:s_time],params[:e_time]])
    end

    if params[:action_type]=='activity' && params[:location_id]!=nil
      @activities=Activity.where(["location_id=?",params[:location_id]]).order("created_at DESC")
    end

    #@activities=Activity.find_by_sql(["select * from activities where id in (select activity_id from activity_tags,user_follow_tags where user_follow_tags.user_id=? and user_follow_tags.follow_id=activity_tags.tag_id);",session[:current_user_id]])

    layout=true
    if params[:part]!=nil
      layout=false
    end

    respond_to do |format|
      format.html {render :layout=>layout}
    end
  end
  def new_fast
    render :layout=>false
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end
  def mini_list
    @activities=Activity.where(["location_id=?",params[:location_id]]).order("created_at DESC")
    layout= params[:partial]=='true' ? false : true

    render :layout=>layout
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @activity = Activity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  def collection
    today=Time.now.in_time_zone
    if params[:move]==nil
      params[:move]=0
    end
    params[:s_date]=today+params[:move].to_i.days - [6, 0, 1, 2, 3, 4, 5][today.wday].days
    params[:e_date]=today+params[:move].to_i.days + [0, 6, 5, 4, 3, 2, 1][today.wday].days

    s_date=params[:s_date].change(:hour=>0)
    e_date=params[:e_date]

    @collection=[]
    i=1
    while i<=7 do
      @collection[i]=Activity.find_by_sql(["select activities.* from activities where starttime>=? and starttime<? and id in (select activity_id from activity_user_actions where activity_user_actions.user_id=? and activity_user_actions.action_type='in') order by starttime",s_date+(i-1).days,s_date+i.days,session[:current_user_id]])
      i+=1
    end


    if params[:move].to_i==0
      todaynum=today.wday-1
    else
      todaynum=-1
    end
    @date={:today=>today,:s_date=>s_date,:e_date=>e_date,:todaynum=>todaynum,:move=>params[:move]}


    

    layout= params[:part]=='true' ? false : true

    respond_to do |format|
      format.html {render :layout=>layout}
      format.json {render json: @collection}
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
   act=params[:activity]
   params[:activity][:user_id]=session[:current_user_id]
   params[:activity][:location_id]=params[:location_id]

    @activity = Activity.new(params[:activity])



    respond_to do |format|
      if @activity.save
          if params[:tag]!=nil
            params[:tag].each do |f|
              ActivityTag.create({:activity_id=>@activity.id,:tag_id=>f})
              @tag=Tag.find(f)
              @tag.update_attributes({:refnum=>@tag.refnum+1})
            end
          end
          ActivityUserAction.create({:activity_id=>@activity.id,:action_type=>'create',:user_id=>session[:current_user_id]})
          ActivityRef.create({:activity_id=>@activity.id,:ref_name=>'comment',:refnum=>0})
          ActivityRef.create({:activity_id=>@activity.id,:ref_name=>'share',:refnum=>0})
          ActivityRef.create({:activity_id=>@activity.id,:ref_name=>'watch',:refnum=>0})
          ActivityRef.create({:activity_id=>@activity.id,:ref_name=>'in',:refnum=>0})

        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render json: @activity, status: :created, location: @activity }
        format.js {render :nothing=>true}
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :ok }
    end
  end

  def autopick
    @ac_list=Activity.where(" title like ?","%#{params[:term]}%")
    
    tags=[]
    i=0
    @ac_list.each do |l|
        tags[i]={:title=>l.title,:id=>l.id,:location_id=>l.location_id,:location_name=>l.location.name}
      i+=1
    end
    json=tags.to_json
    render json: tags
  end
  def ongoing_list
    @activities=Activity.where([" starttime <? and endtime>?",Time.now.in_time_zone,Time.now.in_time_zone])
    render :layout=>false
  end
end
