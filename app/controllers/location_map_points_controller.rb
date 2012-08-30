class LocationMapPointsController < ApplicationController
  # GET /location_map_points
  # GET /location_map_points.json
  def index
    @location_map_points
    if params[:location_id]==nil
      @location_map_points = LocationMapPoint.all
    else
      @location_map=LocationMap.where('location_id=?',[params[:location_id]])
      if @location_map.length==0
        rs=[]
        points=[]
        rs={:mapurl=>'no_map',:points=>points}
      else
        @location_map_points=LocationMapPoint.where('location_map_id=?',[@location_map.first.id])

        @parent=LocationHaveLocation.where(["child_id=?",params[:location_id]]).first

        rs=[]
        rs={:mapurl=>@location_map.first.map.url(:normal),:points=>@location_map_points,:lid=>params[:location_id],:up_lid=>@parent.location_id}

        

      end
      respond_to do |format|
          format.html # index.html.erb
          format.json { render json: rs }
      end
    end
  end
  
  def saveall
    @l=LocationMapPoint.find(params[:id])
    @l.update_attributes({:cox=>params[:cox],:coy=>params[:coy],:width=>params[:width],:height=>params[:height]})
    
    respond_to do |format|
      format.json {render json: params}
    end
  end

  # GET /location_map_points/1
  # GET /location_map_points/1.json
  def show
    @location_map_point = LocationMapPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location_map_point }
    end
  end

  # GET /location_map_points/new
  # GET /location_map_points/new.json
  def new
    @location_map_point = LocationMapPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_map_point }
    end
  end

  # GET /location_map_points/1/edit
  def edit
    @location_map_point = LocationMapPoint.find(params[:id])
  end

  # POST /location_map_points
  # POST /location_map_points.json
  def create
    params[:location_map_point][:target_id]=params[:location_id]
    @location=Location.find(params[:location_map_point][:target_id])
    if params[:location_map_point][:point_name]==nil
      params[:location_map_point][:point_name]=@location.name
    else
      params[:location_map_point][:point_name]+=@location.name
    end
    @location_map=LocationMap.find(params[:location_map_point][:location_map_id])
    @location_map_point = @location_map.location_map_points.create(params[:location_map_point])

    respond_to do |format|
        format.html { redirect_to location_map_path(@location_map)}
        format.json { render json: @location_map_point.errors, status: :unprocessable_entity }  
        format.js
    end
  end

  # PUT /location_map_points/1
  # PUT /location_map_points/1.json
  def update
    @location_map_point = LocationMapPoint.find(params[:id])

    respond_to do |format|
      if @location_map_point.update_attributes(params[:location_map_point])
        format.html { redirect_to @location_map_point, notice: 'Location map point was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_map_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_map_points/1
  # DELETE /location_map_points/1.json
  def destroy
    @location_map_point = LocationMapPoint.find(params[:id])
    @location_map_point.destroy

    respond_to do |format|
      format.html { redirect_to location_map_points_url }
      format.json { head :ok }
    end
  end
end
