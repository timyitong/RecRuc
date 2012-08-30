class LocationHaveLocationsController < ApplicationController
  # GET /location_have_locations
  # GET /location_have_locations.json
  def index
    @location_have_locations = LocationHaveLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @location_have_locations }
    end
  end

  # GET /location_have_locations/1
  # GET /location_have_locations/1.json
  def show
    @location_have_location = LocationHaveLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location_have_location }
    end
  end

  # GET /location_have_locations/new
  # GET /location_have_locations/new.json
  def new
    @location_have_location = LocationHaveLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_have_location }
    end
  end

  # GET /location_have_locations/1/edit
  def edit
    @location_have_location = LocationHaveLocation.find(params[:id])
  end

  # POST /location_have_locations
  # POST /location_have_locations.json
  def create
    @location_have_location = LocationHaveLocation.new(params[:location_have_location])

    respond_to do |format|
      if @location_have_location.save
        format.html { redirect_to @location_have_location, notice: 'Location have location was successfully created.' }
        format.json { render json: @location_have_location, status: :created, location: @location_have_location }
      else
        format.html { render action: "new" }
        format.json { render json: @location_have_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /location_have_locations/1
  # PUT /location_have_locations/1.json
  def update
    @location_have_location = LocationHaveLocation.find(params[:id])

    respond_to do |format|
      if @location_have_location.update_attributes(params[:location_have_location])
        format.html { redirect_to @location_have_location, notice: 'Location have location was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_have_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_have_locations/1
  # DELETE /location_have_locations/1.json
  def destroy
    @location_have_location = LocationHaveLocation.find(params[:id])
    @location_have_location.destroy

    respond_to do |format|
      format.html { redirect_to location_have_locations_url }
      format.json { head :ok }
    end
  end
end
