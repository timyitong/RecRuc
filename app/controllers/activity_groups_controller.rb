class ActivityGroupsController < ApplicationController
  # GET /activity_groups
  # GET /activity_groups.json
  def index
    @activity_groups = ActivityGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity_groups }
    end
  end

  # GET /activity_groups/1
  # GET /activity_groups/1.json
  def show
    @activity_group = ActivityGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_group }
    end
  end

  # GET /activity_groups/new
  # GET /activity_groups/new.json
  def new
    @activity_group = ActivityGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_group }
    end
  end

  # GET /activity_groups/1/edit
  def edit
    @activity_group = ActivityGroup.find(params[:id])
  end

  # POST /activity_groups
  # POST /activity_groups.json
  def create
    @activity_group = ActivityGroup.new(params[:activity_group])

    respond_to do |format|
      if @activity_group.save
        format.html { redirect_to @activity_group, notice: 'Activity group was successfully created.' }
        format.json { render json: @activity_group, status: :created, location: @activity_group }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activity_groups/1
  # PUT /activity_groups/1.json
  def update
    @activity_group = ActivityGroup.find(params[:id])

    respond_to do |format|
      if @activity_group.update_attributes(params[:activity_group])
        format.html { redirect_to @activity_group, notice: 'Activity group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_groups/1
  # DELETE /activity_groups/1.json
  def destroy
    @activity_group = ActivityGroup.find(params[:id])
    @activity_group.destroy

    respond_to do |format|
      format.html { redirect_to activity_groups_url }
      format.json { head :ok }
    end
  end
end
