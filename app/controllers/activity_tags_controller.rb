class ActivityTagsController < ApplicationController
  # GET /activity_tags
  # GET /activity_tags.json
  def index
    @activity_tags = ActivityTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity_tags }
    end
  end

  # GET /activity_tags/1
  # GET /activity_tags/1.json
  def show
    @activity_tag = ActivityTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_tag }
    end
  end

  # GET /activity_tags/new
  # GET /activity_tags/new.json
  def new
    @activity_tag = ActivityTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_tag }
    end
  end

  # GET /activity_tags/1/edit
  def edit
    @activity_tag = ActivityTag.find(params[:id])
  end

  # POST /activity_tags
  # POST /activity_tags.json
  def create
    @activity_tag = ActivityTag.new(params[:activity_tag])

    respond_to do |format|
      if @activity_tag.save
        format.html { redirect_to @activity_tag, notice: 'Activity tag was successfully created.' }
        format.json { render json: @activity_tag, status: :created, location: @activity_tag }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activity_tags/1
  # PUT /activity_tags/1.json
  def update
    @activity_tag = ActivityTag.find(params[:id])

    respond_to do |format|
      if @activity_tag.update_attributes(params[:activity_tag])
        format.html { redirect_to @activity_tag, notice: 'Activity tag was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_tags/1
  # DELETE /activity_tags/1.json
  def destroy
    @activity_tag = ActivityTag.find(params[:id])
    @activity_tag.destroy

    respond_to do |format|
      format.html { redirect_to activity_tags_url }
      format.json { head :ok }
    end
  end
end
