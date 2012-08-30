#encoding: utf-8
class PublicController < ApplicationController
	def home
	end
	def location_edit
	end
	def online_user
		@location=Location.find(params[:location_id])
		@users=User.find_by_sql(["select users.* from users,user_curlocations where user_curlocations.user_id =users.id and user_curlocations.inuse=1 and user_curlocations.location_id=?",params[:location_id]])
		layout= params[:part]== 'true' ? false : true
		render :layout=>layout
	end
	def timemachine
		
	end
	def search
		if params[:type]=='user'
			@users=User.where(["name like ?","%#{params[:term]}%"])
			render 'users/index'
		elsif params[:type]=='tweet'
			@tweets=Tweet.where(["content like ?","%#{params[:term]}%"])
			render 'tweets/list'
		elsif params[:type]=='activity'
			@activities=Activity.where(["title like ? or slogan like ? or content like ?","%#{params[:term]}%","%#{params[:term]}%","%#{params[:term]}%"])
			render 'activities/index'
		end
			
	end
	def search_autocomplete
	    
	    tags=[]
	    tags[0]={:label=>'搜索含有关键词"'+params[:term]+'"的人',:href=>'/public/search?type=user&term='+params[:term]}
	    tags[1]={:label=>'搜索含有关键词"'+params[:term]+'"的微博',:href=>'/public/search?type=tweet&term='+params[:term]}
	    tags[2]={:label=>'搜索含有关键词"'+params[:term]+'"的活动',:href=>'/public/search?type=activity&term='+params[:term]}

	    json=tags.to_json
	    render json: tags
	end
	def addfollow
		if params[:user_id]!=nil
			UserFollowUser.create({:user_id=>session[:current_user_id],:follow_id=>params[:user_id]})
		end
		if params[:location_id]!=nil
			UserFollowLocation.create({:user_id=>session[:current_user_id],:follow_id=>params[:location_id]})
		end
		if params[:tag_id]!=nil
			UserFollowTag.create({:user_id=>session[:current_user_id],:follow_id=>params[:tag_id]})
		end
		respond_to do |format|
      		format.html { redirect_to 'public/home' }
      		format.json { head :ok }
    	end
	end
	def cancelfollow
		if params[:user_id]!=nil
			@f=UserFollowUser.where(["user_id=:u and follow_id=:f",{:u=>session[:current_user_id],:f=>params[:user_id]}])
			@f.destroy_all
		end
		if params[:location_id]!=nil
			@f=UserFollowLocation.where(["user_id=:u and follow_id=:f",{:u=>session[:current_user_id],:f=>params[:location_id]}])
			@f.destroy_all
		end
		if params[:tag_id]!=nil
			@f=UserFollowTag.where(["user_id=:u and follow_id=:f",{:u=>session[:current_user_id],:f=>params[:tag_id]}])
			@f.destroy_all
		end
		respond_to do |format|
      		format.html { redirect_to 'public/home' }
      		format.json { head :ok }
    	end
	end
end
