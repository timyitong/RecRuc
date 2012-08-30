class UserFollowLocationsController < ApplicationController
  # GET /user_follow_locations
  # GET /user_follow_locations.json
  def index
    @user_follow_locations = UserFollowLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_follow_locations }
    end
  end

  # GET /user_follow_locations/1
  # GET /user_follow_locations/1.json
  def show
    @user_follow_location = UserFollowLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_follow_location }
    end
  end

  # GET /user_follow_locations/new
  # GET /user_follow_locations/new.json
  def new
    @user_follow_location = UserFollowLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_follow_location }
    end
  end

  # GET /user_follow_locations/1/edit
  def edit
    @user_follow_location = UserFollowLocation.find(params[:id])
  end

  # POST /user_follow_locations
  # POST /user_follow_locations.json
  def create
    @user_follow_location = UserFollowLocation.new(params[:user_follow_location])

    respond_to do |format|
      if @user_follow_location.save
        format.html { redirect_to @user_follow_location, notice: 'User follow location was successfully created.' }
        format.json { render json: @user_follow_location, status: :created, location: @user_follow_location }
      else
        format.html { render action: "new" }
        format.json { render json: @user_follow_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_follow_locations/1
  # PUT /user_follow_locations/1.json
  def update
    @user_follow_location = UserFollowLocation.find(params[:id])

    respond_to do |format|
      if @user_follow_location.update_attributes(params[:user_follow_location])
        format.html { redirect_to @user_follow_location, notice: 'User follow location was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_follow_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_follow_locations/1
  # DELETE /user_follow_locations/1.json
  def destroy
    @user_follow_location = UserFollowLocation.find(params[:id])
    @user_follow_location.destroy

    respond_to do |format|
      format.html { redirect_to user_follow_locations_url }
      format.json { head :ok }
    end
  end
end
