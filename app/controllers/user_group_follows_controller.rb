class UserGroupFollowsController < ApplicationController
  # GET /user_group_follows
  # GET /user_group_follows.json
  def index
    @user_group_follows = UserGroupFollow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_group_follows }
    end
  end

  def follow   
    
    params[:user_group_id].each do |id|
    UserGroupFollow.create(:user_id=>params[:user_id],:user_group_id=>id)
    end
    
    respond_to do |format|
      format.js { render json: params[:user_id] } 
      #format.html {render params[:user_group_id] }
    end
  end
  
  def cancel_follow
    @user=User.find(params[:user_id])
     User.find(session[:current_user_id]).user_group_follows.where("user_group_follows.user_id=?",[params[:user_id]]).each do |f|
       f.destroy
     end 
    redirect_to user_path(@user)
  end

  # GET /user_group_follows/1
  # GET /user_group_follows/1.json
  def show
    @user_group_follow = UserGroupFollow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_group_follow }
    end
  end

  # GET /user_group_follows/new
  # GET /user_group_follows/new.json
  def new
    @user_group_follow = UserGroupFollow.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_group_follow }
    end
  end

  # GET /user_group_follows/1/edit
  def edit
    @user_group_follow = UserGroupFollow.find(params[:id])
  end

  # POST /user_group_follows
  # POST /user_group_follows.json
  def create
    @user_group_follow = UserGroupFollow.new(params[:user_group_follow])

    respond_to do |format|
      if @user_group_follow.save
        format.html { redirect_to @user_group_follow, notice: 'User group follow was successfully created.' }
        format.json { render json: @user_group_follow, status: :created, location: @user_group_follow }
      else
        format.html { render action: "new" }
        format.json { render json: @user_group_follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_group_follows/1
  # PUT /user_group_follows/1.json
  def update
    @user_group_follow = UserGroupFollow.find(params[:id])

    respond_to do |format|
      if @user_group_follow.update_attributes(params[:user_group_follow])
        format.html { redirect_to @user_group_follow, notice: 'User group follow was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_group_follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_group_follows/1
  # DELETE /user_group_follows/1.json
  def destroy
    @user_group_follow = UserGroupFollow.find(params[:id])
    @user_group_follow.destroy

    respond_to do |format|
      format.html { redirect_to user_group_follows_url }
      format.json { head :ok }
    end
  end
end
