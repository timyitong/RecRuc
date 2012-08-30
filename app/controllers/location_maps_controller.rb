#encoding: utf-8
class LocationMapsController < ApplicationController
  # GET /location_maps
  # GET /location_maps.json
  def index
    
    @location_maps = LocationMap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @location_maps }
    end
  end

  # GET /location_maps/1
  # GET /location_maps/1.json
  def show
    @location_map = LocationMap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location_map }
    end
  end
  

  # GET /location_maps/new
  # GET /location_maps/new.json
  def new
    @location_map = LocationMap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_map }
    end
  end

  # GET /location_maps/1/edit
  def edit
    if (params[:location_id]==nil)
      @location_map = LocationMap.find(params[:id])
    else
      @location_map=Location.find(params[:location_id]).location_map
    end
    render :layout=>false
  end

  # POST /location_maps
  # POST /location_maps.json
  def create
    @location_map = LocationMap.new(params[:location_map])

    respond_to do |format|
      if @location_map.save
        format.html { redirect_to @location_map, notice: 'Location map was successfully created.' }
        format.json { render json: @location_map, status: :created, location: @location_map }
      else
        format.html { render action: "new" }
        format.json { render json: @location_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /location_maps/1
  # PUT /location_maps/1.json
  def update
    @location_map = LocationMap.find(params[:id])

    respond_to do |format|
      if @location_map.update_attributes(params[:location_map])
        format.html { redirect_to @location_map, notice: 'Location map was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_maps/1
  # DELETE /location_maps/1.json
  def destroy
    @location_map = LocationMap.find(params[:id])
    @location_map.destroy

    respond_to do |format|
      format.html { redirect_to location_maps_url }
      format.json { head :ok }
    end
  end

  def loadmap
    if (params[:up]!=nil)
      @lhl=LocationHaveLocation.where(["child_id=?",params[:location_id]])

      @location_map=LocationMap.where(["location_id=?",@lhl.first.location_id]).first
    else
      @location_map=LocationMap.where('location_id=?',params[:location_id]).first
    end
    render :layout=>false
  end
end
