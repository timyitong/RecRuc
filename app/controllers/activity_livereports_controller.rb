class ActivityLivereportsController < ApplicationController
  # GET /activity_livereports
  # GET /activity_livereports.json
  def index
    @activity_livereports = ActivityLivereport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity_livereports }
    end
  end

  # GET /activity_livereports/1
  # GET /activity_livereports/1.json
  def show
    @activity_livereport = ActivityLivereport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_livereport }
    end
  end

  # GET /activity_livereports/new
  # GET /activity_livereports/new.json
  def new
    @activity_livereport = ActivityLivereport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_livereport }
    end
  end

  # GET /activity_livereports/1/edit
  def edit
    @activity_livereport = ActivityLivereport.find(params[:id])
  end

  # POST /activity_livereports
  # POST /activity_livereports.json
  def create
    @activity_livereport = ActivityLivereport.new(params[:activity_livereport])

    respond_to do |format|
      if @activity_livereport.save
        format.html { redirect_to @activity_livereport, notice: 'Activity livereport was successfully created.' }
        format.json { render json: @activity_livereport, status: :created, location: @activity_livereport }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_livereport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activity_livereports/1
  # PUT /activity_livereports/1.json
  def update
    @activity_livereport = ActivityLivereport.find(params[:id])

    respond_to do |format|
      if @activity_livereport.update_attributes(params[:activity_livereport])
        format.html { redirect_to @activity_livereport, notice: 'Activity livereport was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_livereport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_livereports/1
  # DELETE /activity_livereports/1.json
  def destroy
    @activity_livereport = ActivityLivereport.find(params[:id])
    @activity_livereport.destroy

    respond_to do |format|
      format.html { redirect_to activity_livereports_url }
      format.json { head :ok }
    end
  end
end
