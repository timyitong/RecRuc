class SearchController < ApplicationController
  def autocomplete
    @location=Location.where(" name like ?","%#{params[:term]}%")
    
    tags=[]
    i=0
    @location.each do |l|
      tags[i]=l.name
      i+=1
    end
    json=tags.to_json
    render json: tags
    #render json: [{label:"123",value:"321"}]
    #render  json: json.gsub!(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")}  #force it to be utf-8 encoding
  end
end
