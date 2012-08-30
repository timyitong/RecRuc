class ActivityRefsController < ApplicationController
  # GET /activity_refs
  # GET /activity_refs.json
  def index
    @activity_refs = ActivityRef.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity_refs }
    end
  end

  # GET /activity_refs/1
  # GET /activity_refs/1.json
  def show
    @activity_ref = ActivityRef.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_ref }
    end
  end

  # GET /activity_refs/new
  # GET /activity_refs/new.json
  def new
    @activity_ref = ActivityRef.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_ref }
    end
  end

  # GET /activity_refs/1/edit
  def edit
    @activity_ref = ActivityRef.find(params[:id])
  end

  # POST /activity_refs
  # POST /activity_refs.json
  def create
    @activity_ref = ActivityRef.new(params[:activity_ref])

    respond_to do |format|
      if @activity_ref.save
        format.html { redirect_to @activity_ref, notice: 'Activity ref was successfully created.' }
        format.json { render json: @activity_ref, status: :created, location: @activity_ref }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_ref.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activity_refs/1
  # PUT /activity_refs/1.json
  def update
    @activity_ref = ActivityRef.find(params[:id])

    respond_to do |format|
      if @activity_ref.update_attributes(params[:activity_ref])
        format.html { redirect_to @activity_ref, notice: 'Activity ref was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_ref.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_refs/1
  # DELETE /activity_refs/1.json
  def destroy
    @activity_ref = ActivityRef.find(params[:id])
    @activity_ref.destroy

    respond_to do |format|
      format.html { redirect_to activity_refs_url }
      format.json { head :ok }
    end
  end
end
