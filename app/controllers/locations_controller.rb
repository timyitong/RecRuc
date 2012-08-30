# encoding: utf-8
class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index
    @locations
    if params[:id]==nil
      @locations = Location.all
    else
      @location=Location.find(params[:id])
      @locations =Location.where("uptree=?","#{@location.uptree}#{@location.id}-")
    end
    
     respond_to do |format|
        format.html 
        format.json { render json: @locations }
     end
  end

  def routepicker
     @location=Location.find(params[:id])

     respond_to do |format|
        format.html {render :layout=>false}
        format.json { render json: @location }
     end

  end

  def mini_show
    @location=Location.find(params[:location_id])
    render :layout=>false
  end

  def at_here
    UserCurlocation.where(:location_id=>session[:current_user_location],:user_id=>session[:current_user_id],:inuse=>1).order('created_at DESC').first.update_attributes({:inuse=>0})
    Juggernaut.publish('online_location_'+session[:current_user_location].to_s,{:name=>session[:current_user_name],:id=>session[:current_user_id],:op=>'del'})
   
    session[:current_user_location]=params[:location_id]
    UserCurlocation.create({:location_id=>session[:current_user_location],:user_id=>session[:current_user_id],:inuse=>1})
    Juggernaut.publish('online_location_'+session[:current_user_location].to_s,{:name=>session[:current_user_name],:id=>session[:current_user_id],:op=>'add'})
    
    @location=Location.find(params[:location_id])
    respond_to do |format|
      format.json
      format.js
      format.html
    end
  end

  def pick
    @location=Location.find(params[:id])
    child=[]
    i=0
    @location.location_have_locations.each do |l|
        temp_l=Location.find(l.child_id)
        child[i]={:name=>temp_l.name,:id=>temp_l.id}
        i+=1
    end

    parent=[]
    i=0
    @location.uptree.chomp.split('-').each do |s|
      if s!=''
        temp_l2=Location.find(s.to_s)
        parent[i]={:name=>temp_l2.name,:id=>temp_l2.id}
        i+=1
      end
    end

    arr={:id=>@location.id,:name=>@location.name,:parent=>parent,:child=>child}

    respond_to do |format|
        format.json {render json:arr}
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    rs={:location=>@location,:url=>@location.location_icon.url(:normal),:map_id=>@location.location_map.id}
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: rs }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    if params[:location_id]!=nil
    @parent_location=Location.find_by_id(params[:location_id])
    params[:location][:uptree]=@parent_location.uptree+@parent_location.id.to_s+'-'

    params[:location][:nametree]=@parent_location.nametree+'-'+params[:location][:name]
    end


    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        LocationHaveLocation.create({:location_id=>@parent_location.id,:child_id=>@location.id})

        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :ok }
    end
  end

  def autopick
    @location_list=Location.where(" nametree like ?","%#{params[:term]}%")
    
    tags=[]
    i=0
    @location_list.each do |l|
        tags[i]={:nametree=>l.nametree,:name=>l.name,:id=>l.id}
      i+=1
    end
    json=tags.to_json
    render json: tags
  end
end
