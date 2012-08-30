# encoding: utf-8
class ActivityUserActionsController < ApplicationController
  # GET /activity_user_actions
  # GET /activity_user_actions.json
  def index
    

    #for the home.html.erb
    if params[:index]=='tag'  
      @activity_user_actions = ActivityUserAction.find_by_sql(["select * from activity_user_actions where activity_id in (select activity_id from user_follow_tags,activity_tags where user_follow_tags.user_id=? and user_follow_tags.follow_id=activity_tags.tag_id) order by created_at DESC;",session[:current_user_id]])
    end
    if params[:index]=='location'
      @activity_user_actions=ActivityUserAction.find_by_sql(["select * from activity_user_actions where action_type='create' and activity_id in (select id from activities where location_id in (select follow_id from user_follow_locations where user_id=?) )order by created_at DESC;",session[:current_user_id]])
    end
    if params[:index]=='user'
      @activity_user_actions=ActivityUserAction.find_by_sql(["select * from activity_user_actions where user_id in (select follow_id from user_follow_users where user_id=?) or user_id=? order by created_at DESC;",session[:current_user_id],session[:current_user_id]])
    end

    #for users/show.html.erb
        # @activity_user_actions = ActivityUserAction.find_by_sql(["select * from activity_user_actions where activity_id in (select activity_id from user_follow_tags,activity_tags where user_follow_tags.user_id=? and user_follow_tags.follow_id=activity_tags.tag_id) order by created_at DESC;",session[:current_user_id]])
    if params[:action_type]!=nil && params[:user_id]!=nil
      @activity_user_actions=ActivityUserAction.where(["user_id=? and action_type=?",params[:user_id],params[:action_type]]).order("created_at DESC")
    end

    #for tags/show.html.erb
    if params[:tag_id]!=nil
      @activity_user_actions=ActivityUserAction.find_by_sql(["select * from activity_user_actions where action_type='create' and activity_id in (select activity_id from activity_tags where tag_id=?) order by created_at DESC;",params[:tag_id]])
    end


    layout=true
    if params[:part]!=nil
      layout=false
    end

    respond_to do |format|
      format.html {render :layout=>layout}
      format.json { render json: @activity_user_actions }
    end
  end
  
  def addAction
    @activity_user_action=ActivityUserAction.create({:user_id=>session[:current_user_id],:action_type=>params[:action_type],:note=>params[:note],:activity_id=>params[:activity_id]})

    @af=ActivityRef.where(["activity_id=? and ref_name=?",params[:activity_id],params[:action_type]])
    num=@af[0].refnum+1
    @af[0].update_attributes({:refnum=>num})


    @message='中文'
    respond_to do |format|
        format.html { redirect_to @activity_user_action, notice: 'Activity user action was successfully created.' }
        format.json { render json: @activity_user_action, status: :created, location: @activity_user_action }
        format.js 
    end
  end

  # GET /activity_user_actions/1
  # GET /activity_user_actions/1.json
  def show
    @activity_user_action = ActivityUserAction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_user_action }
    end
  end

  # GET /activity_user_actions/new
  # GET /activity_user_actions/new.json
  def new
    @activity_user_action = ActivityUserAction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_user_action }
    end
  end

  # GET /activity_user_actions/1/edit
  def edit
    @activity_user_action = ActivityUserAction.find(params[:id])
  end

  # POST /activity_user_actions
  # POST /activity_user_actions.json
  def create
    params[:activity_user_action][:user_id]=session[:current_user_id]
    @activity_user_action = ActivityUserAction.new(params[:activity_user_action])

    respond_to do |format|
      if @activity_user_action.save
        format.html { redirect_to @activity_user_action, notice: 'Activity user action was successfully created.' }
        format.json { render json: @activity_user_action, status: :created, location: @activity_user_action }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_user_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activity_user_actions/1
  # PUT /activity_user_actions/1.json
  def update
    @activity_user_action = ActivityUserAction.find(params[:id])

    respond_to do |format|
      if @activity_user_action.update_attributes(params[:activity_user_action])
        format.html { redirect_to @activity_user_action, notice: 'Activity user action was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_user_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_user_actions/1
  # DELETE /activity_user_actions/1.json
  def destroy
    @activity_user_action = ActivityUserAction.find(params[:id])
    @activity_user_action.destroy

    respond_to do |format|
      format.html { redirect_to activity_user_actions_url }
      format.json { head :ok }
      format.js
    end
  end
end
