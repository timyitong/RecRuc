#encoding: utf-8
class TagsController < ApplicationController
  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.where([""]).order("refnum DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tags }
    end
  end
  def hot_list
    @tags=Tag.find_by_sql(["select * from tags order by refnum DESC limit 12"])
    render :layout=>false
  end

  def quickcreate

    if !Tag.exists?(:name => params[:name])
    @tag = Tag.create({:name=>params[:name],:refnum=>0,:wiki=>'尚无描述'})
    else
    @tag='null'
    end

    respond_to do |format|
      format.json {render json: @tag}
      format.js   {render json: @tag}
    end
  end

  def search
 
    @tag_list=Tag.where(" name like ?","%#{params[:term]}%")
    
    tags=[]
    i=0
    @tag_list.each do |l|
        tags[i]={:value=>l.name,:label=>l.name,:id=>l.id,:desc=>l.wiki,:refnum=>l.refnum}
      i+=1
    end
    json=tags.to_json
    render json: tags
    #render json: [{label:"123",value:"321"}]
    #render  json: json.gsub!(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")}  #force it to be utf-8 encoding
  
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /tags/new
  # GET /tags/new.json
  def new
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /tags
  # POST /tags.json
  def create
    params[:tag][:refnum]=0
    params[:tag][:wiki]='尚无描述'
    @tag = Tag.new(params[:tag])

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render json: @tag, status: :created, location: @tag }
      else
        format.html { render action: "new" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.json
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :ok }
    end
  end
end
