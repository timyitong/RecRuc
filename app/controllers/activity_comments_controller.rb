#encoding: utf-8
class ActivityCommentsController < ApplicationController
  # GET /activity_comments
  # GET /activity_comments.json
  def index
    if params[:activity_id]==nil
      @activity_comments = ActivityComment.order("created_at DESC").all
    else
      @activity_comments = ActivityComment.where('activity_id=?',[params[:activity_id]]).order("created_at DESC")
    end

    if params[:part]==nil
      layout=true
    else
      layout=false
    end

    @activity_id=params[:activity_id]
    respond_to do |format|
      format.html {render :layout=> layout}# index.html.erb
    end
  end

  # GET /activity_comments/1
  # GET /activity_comments/1.json
  def show
    @activity_comment = ActivityComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_comment }
    end
  end

  # GET /activity_comments/new
  # GET /activity_comments/new.json
  def new
    @activity_comment = ActivityComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_comment }
    end
  end

  # GET /activity_comments/1/edit
  def edit
    @activity_comment = ActivityComment.find(params[:id])
  end

  # POST /activity_comments
  # POST /activity_comments.json
  def create
    params[:activity_comment][:user_id]=session[:current_user_id]
    @activity_comment = ActivityComment.new(params[:activity_comment])
    if !ActivityUserAction.exists?(:user_id=>session[:current_user_id],:activity_id=>params[:activity_comment][:activity_id],:action_type=>'comment')
      ActivityUserAction.create({:user_id=>session[:current_user_id],:activity_id=>params[:activity_comment][:activity_id],:action_type=>'comment',:note=>''})
    end

    respond_to do |format|
      if @activity_comment.save

        @af=ActivityRef.where(["ref_name='comment' and activity_id=?",params[:activity_comment][:activity_id]])
        num=@af[0].refnum+1
        @af[0].update_attributes({:refnum=>num})

        @message='发布成功'

        format.html { redirect_to @activity_comment, notice: 'Activity comment was successfully created.' }
        format.json { render json: @activity_comment, status: :created, location: @activity_comment }
        format.js 
      else
        @message='fail'

        format.html { render action: "new" }
        format.json { render json: @activity_comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /activity_comments/1
  # PUT /activity_comments/1.json
  def update
    @activity_comment = ActivityComment.find(params[:id])

    respond_to do |format|
      if @activity_comment.update_attributes(params[:activity_comment])
        format.html { redirect_to @activity_comment, notice: 'Activity comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_comments/1
  # DELETE /activity_comments/1.json
  def destroy
    @activity_comment = ActivityComment.find(params[:id])
    @activity_comment.destroy

    respond_to do |format|
      format.html { redirect_to activity_comments_url }
      format.json { head :ok }
    end
  end
end
