class UserFollowUsersController < ApplicationController
  # GET /user_follow_users
  # GET /user_follow_users.json
  def index
    @user_follow_users = UserFollowUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_follow_users }
    end
  end

  # GET /user_follow_users/1
  # GET /user_follow_users/1.json
  def show
    @user_follow_user = UserFollowUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_follow_user }
    end
  end

  # GET /user_follow_users/new
  # GET /user_follow_users/new.json
  def new
    @user_follow_user = UserFollowUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_follow_user }
    end
  end

  # GET /user_follow_users/1/edit
  def edit
    @user_follow_user = UserFollowUser.find(params[:id])
  end

  # POST /user_follow_users
  # POST /user_follow_users.json
  def create
    @user_follow_user = UserFollowUser.new(params[:user_follow_user])

    respond_to do |format|
      if @user_follow_user.save
        format.html { redirect_to @user_follow_user, notice: 'User follow user was successfully created.' }
        format.json { render json: @user_follow_user, status: :created, location: @user_follow_user }
      else
        format.html { render action: "new" }
        format.json { render json: @user_follow_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_follow_users/1
  # PUT /user_follow_users/1.json
  def update
    @user_follow_user = UserFollowUser.find(params[:id])

    respond_to do |format|
      if @user_follow_user.update_attributes(params[:user_follow_user])
        format.html { redirect_to @user_follow_user, notice: 'User follow user was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_follow_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_follow_users/1
  # DELETE /user_follow_users/1.json
  def destroy
    @user_follow_user = UserFollowUser.find(params[:id])
    @user_follow_user.destroy

    respond_to do |format|
      format.html { redirect_to user_follow_users_url }
      format.json { head :ok }
    end
  end
end
