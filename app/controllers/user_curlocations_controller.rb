class UserCurlocationsController < ApplicationController
  # GET /user_curlocations
  # GET /user_curlocations.json
  def index
    @user_curlocations = UserCurlocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_curlocations }
    end
  end

  # GET /user_curlocations/1
  # GET /user_curlocations/1.json
  def show
    @user_curlocation = UserCurlocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_curlocation }
    end
  end

  # GET /user_curlocations/new
  # GET /user_curlocations/new.json
  def new
    @user_curlocation = UserCurlocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_curlocation }
    end
  end

  # GET /user_curlocations/1/edit
  def edit
    @user_curlocation = UserCurlocation.find(params[:id])
  end

  # POST /user_curlocations
  # POST /user_curlocations.json
  def create
    @user_curlocation = UserCurlocation.new(params[:user_curlocation])

    respond_to do |format|
      if @user_curlocation.save
        format.html { redirect_to @user_curlocation, notice: 'User curlocation was successfully created.' }
        format.json { render json: @user_curlocation, status: :created, location: @user_curlocation }
      else
        format.html { render action: "new" }
        format.json { render json: @user_curlocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_curlocations/1
  # PUT /user_curlocations/1.json
  def update
    @user_curlocation = UserCurlocation.find(params[:id])

    respond_to do |format|
      if @user_curlocation.update_attributes(params[:user_curlocation])
        format.html { redirect_to @user_curlocation, notice: 'User curlocation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_curlocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_curlocations/1
  # DELETE /user_curlocations/1.json
  def destroy
    @user_curlocation = UserCurlocation.find(params[:id])
    @user_curlocation.destroy

    respond_to do |format|
      format.html { redirect_to user_curlocations_url }
      format.json { head :ok }
    end
  end
end
