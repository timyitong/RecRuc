class LocationMapPointImgsController < ApplicationController
  # GET /location_map_point_imgs
  # GET /location_map_point_imgs.json
  def index
    @location_map_point_imgs = LocationMapPointImg.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @location_map_point_imgs }
    end
  end

  # GET /location_map_point_imgs/1
  # GET /location_map_point_imgs/1.json
  def show
    @location_map_point_img = LocationMapPointImg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location_map_point_img }
    end
  end

  # GET /location_map_point_imgs/new
  # GET /location_map_point_imgs/new.json
  def new
    @location_map_point_img = LocationMapPointImg.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_map_point_img }
    end
  end

  # GET /location_map_point_imgs/1/edit
  def edit
    @location_map_point_img = LocationMapPointImg.find(params[:id])
  end

  # POST /location_map_point_imgs
  # POST /location_map_point_imgs.json
  def create
    @location_map_point_img = LocationMapPointImg.new(params[:location_map_point_img])

    respond_to do |format|
      if @location_map_point_img.save
        format.html { redirect_to @location_map_point_img, notice: 'Location map point img was successfully created.' }
        format.json { render json: @location_map_point_img, status: :created, location: @location_map_point_img }
      else
        format.html { render action: "new" }
        format.json { render json: @location_map_point_img.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /location_map_point_imgs/1
  # PUT /location_map_point_imgs/1.json
  def update
    @location_map_point_img = LocationMapPointImg.find(params[:id])

    respond_to do |format|
      if @location_map_point_img.update_attributes(params[:location_map_point_img])
        format.html { redirect_to @location_map_point_img, notice: 'Location map point img was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_map_point_img.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_map_point_imgs/1
  # DELETE /location_map_point_imgs/1.json
  def destroy
    @location_map_point_img = LocationMapPointImg.find(params[:id])
    @location_map_point_img.destroy

    respond_to do |format|
      format.html { redirect_to location_map_point_imgs_url }
      format.json { head :ok }
    end
  end
end
