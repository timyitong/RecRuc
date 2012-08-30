class UserFollowTagsController < ApplicationController
  # GET /user_follow_tags
  # GET /user_follow_tags.json
  def index
    @user_follow_tags = UserFollowTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_follow_tags }
    end
  end

  # GET /user_follow_tags/1
  # GET /user_follow_tags/1.json
  def show
    @user_follow_tag = UserFollowTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_follow_tag }
    end
  end

  # GET /user_follow_tags/new
  # GET /user_follow_tags/new.json
  def new
    @user_follow_tag = UserFollowTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_follow_tag }
    end
  end

  # GET /user_follow_tags/1/edit
  def edit
    @user_follow_tag = UserFollowTag.find(params[:id])
  end

  # POST /user_follow_tags
  # POST /user_follow_tags.json
  def create
    @user_follow_tag = UserFollowTag.new(params[:user_follow_tag])

    respond_to do |format|
      if @user_follow_tag.save
        format.html { redirect_to @user_follow_tag, notice: 'User follow tag was successfully created.' }
        format.json { render json: @user_follow_tag, status: :created, location: @user_follow_tag }
      else
        format.html { render action: "new" }
        format.json { render json: @user_follow_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_follow_tags/1
  # PUT /user_follow_tags/1.json
  def update
    @user_follow_tag = UserFollowTag.find(params[:id])

    respond_to do |format|
      if @user_follow_tag.update_attributes(params[:user_follow_tag])
        format.html { redirect_to @user_follow_tag, notice: 'User follow tag was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_follow_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_follow_tags/1
  # DELETE /user_follow_tags/1.json
  def destroy
    @user_follow_tag = UserFollowTag.find(params[:id])
    @user_follow_tag.destroy

    respond_to do |format|
      format.html { redirect_to user_follow_tags_url }
      format.json { head :ok }
    end
  end
end
