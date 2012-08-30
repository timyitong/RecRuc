class ActivityTweetsController < ApplicationController
  # GET /activity_tweets
  # GET /activity_tweets.json
  def index
    @activity_tweets = ActivityTweet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity_tweets }
    end
  end

  # GET /activity_tweets/1
  # GET /activity_tweets/1.json
  def show
    @activity_tweet = ActivityTweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_tweet }
    end
  end

  # GET /activity_tweets/new
  # GET /activity_tweets/new.json
  def new
    @activity_tweet = ActivityTweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_tweet }
    end
  end

  # GET /activity_tweets/1/edit
  def edit
    @activity_tweet = ActivityTweet.find(params[:id])
  end

  # POST /activity_tweets
  # POST /activity_tweets.json
  def create
    @activity_tweet = ActivityTweet.new(params[:activity_tweet])

    respond_to do |format|
      if @activity_tweet.save
        format.html { redirect_to @activity_tweet, notice: 'Activity tweet was successfully created.' }
        format.json { render json: @activity_tweet, status: :created, location: @activity_tweet }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activity_tweets/1
  # PUT /activity_tweets/1.json
  def update
    @activity_tweet = ActivityTweet.find(params[:id])

    respond_to do |format|
      if @activity_tweet.update_attributes(params[:activity_tweet])
        format.html { redirect_to @activity_tweet, notice: 'Activity tweet was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_tweets/1
  # DELETE /activity_tweets/1.json
  def destroy
    @activity_tweet = ActivityTweet.find(params[:id])
    @activity_tweet.destroy

    respond_to do |format|
      format.html { redirect_to activity_tweets_url }
      format.json { head :ok }
    end
  end
end
