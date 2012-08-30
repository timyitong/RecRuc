class TweetsController < ApplicationController
  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweets }
    end
  end
  
  def index_group
    @tweet=Tweet.find_by_sql(['select * from tweets where user_id in 
      (select user_id from user_group_follows where user_group_id=?) order by created_at DESC;',params[:user_group_id]])
    respond_to do |format|
      format.js
      #format.html 
    end
  end
  
  def list
    if params[:index]=='user'
      @tweets=Tweet.find_by_sql(["select distinct tweets.* from tweets,user_follow_users where tweets.user_id=? or (user_follow_users.user_id=? and tweets.user_id=user_follow_users.follow_id) order by tweets.created_at DESC",session[:current_user_id],session[:current_user_id]])
      #某个用户的微博@tweets =Tweet.find_by_sql(["select tweets.*,users.name,locations.name from tweets,users,locations where tweets.user_id=users.id and tweets.location_id=locations.id tweets.user_id=? order by tweets.created_at DESC;",params[:user_id]]);
    elsif params[:activity_id]!=nil
      @tweets=Tweet.where(["activity_id=?",params[:activity_id]])
    elsif params[:location_id]!=nil
      @tweets=Tweet.where(["location_id=?",params[:location_id]]).order("created_at DESC")
    elsif
      @tweets=Tweet.all
    end
    
    layout= (params[:part]=='true') ? false  : true
    respond_to do |format|
      format.json {render json: @tweets}
      format.js {render :json => @tweets}
      format.html {render :layout=>layout}
    end
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweet }
    end
  end
  
  def show_list
    
    respond_to do |format|
      format.json { }
    end
  end

  # GET /tweets/new
  # GET /tweets/new.json
  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.json
  def create
    if params[:location_id]==0 ||params[:location_id]=='0'
      @location=Location.find(session[:current_user_location])
    else
       @location=Location.find(params[:location_id])
    end

    if params[:tweet][:retweet_id]!=0 && params[:tweet][:retweet_id]!='0' && params[:tweet][:retweet_id]!=nil
      Tweet.find(params[:tweet][:retweet_id]).add_retweetsnum
      if (params[:tweet][:retweet_id]!=params[:tweet][:parent_id])
        Tweet.find(params[:tweet][:parent_id]).add_retweetsnum
      end
    end

    params[:tweet][:location_id]=@location.id
    params[:tweet][:user_id]=session[:current_user_id]
    params[:tweet][:retweetsnum]=0
    params[:tweet][:commentsnum]=0

    if params[:activity_id]==nil
      params[:tweet][:activity_id]=0
    else 
      params[:tweet][:activity_id]=params[:activity_id]
    end

    @tweet=Tweet.create(params[:tweet])

    respond_to do |format|
      format.html {redirect_to '/'}
      format.js {}
    end
  end

  # PUT /tweets/1
  # PUT /tweets/1.json
  def update
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :ok }
    end
  end

  def publish

   
    if params[:location_id]==0 ||params[:location_id]=='0'
      @location=Location.find(session[:current_user_location])
    else
       @location=Location.find(params[:location_id])
    end

    params[:tweet][:location_id]=@location.id
    params[:tweet][:user_id]=session[:current_user_id]
    params[:tweet][:retweetsnum]=0
    params[:tweet][:commentsnum]=0

    if params[:activity_id]==nil
      params[:tweet][:activity_id]=0
    else 
      params[:tweet][:activity_id]=params[:activity_id]
    end

    Tweet.create(params[:tweet])

    respond_to do |format|
      format.html {redirect_to '/'}
      format.js
    end

  end

  def mini_list

    layout=true

    if params[:partial]!=nil
      layout=false
    end

    @location=Location.find(params[:location_id])

    @tweets=Tweet.find_by_sql(["select tweets.* from tweets,locations where tweets.location_id=locations.id and locations.nametree like ? order by tweets.created_at DESC","%#{@location.nametree}%"])



    render :layout=>layout
  end
  
end
