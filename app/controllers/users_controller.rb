#encoding: utf-8
class UsersController < ApplicationController
  skip_before_filter :check_session, :only=>[:check,:login,:new,:create,:reg]
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json

  
  def show
    if session[:current_user_id]==nil
      redirect_to :action=> "login"
    
    else
      @user = User.find(params[:id])
      

      respond_to do |format|
      format.html 
      format.json { render json: @user }
      end
    end
  end
  def profile
     @user = User.find(params[:id])
     follow_num=UserFollowUser.where(["user_id=?",params[:id]]).count
     be_follow_num=UserFollowUser.where(["follow_id=?",params[:id]]).count
     tweet_num=Tweet.where(["user_id=?",params[:id]]).count
     activity_num=Activity.where(["user_id=?",params[:id]]).count
     @num={:follow_num=>follow_num,:be_follow_num=>be_follow_num,:tweet_num=>tweet_num,:activity_num=>activity_num}
     render :layout=>false 
  end
    
  
  def home
    if session[:current_user_id]==nil
      redirect_to :action=> "login"
    else
      @user =User.find(session[:current_user_id])
      
      respond_to do |format|
        format.html
        format.json {render json: @user}
      end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html {render :layout=>false}
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
      @user = User.find(params[:id])
  end
  
  # POST /users
  # POST /users.json
  def create
    @user=User.new(params[:user])
    if @user.save
      render :action=>:check
    else
      render :action=>:new
    end
  end

  def reg
    @user=User.new(params[:user])

    url='/register'
    note=''

    if params[:user][:email]=='' || params[:user][:password]=='' || params[:user][:name]==''
      note= '邮箱、密码、昵称不能为空'
    elsif User.where(['email=?',params[:user][:email]]).exists?
      note='邮箱已被注册'
    elsif User.where(['name=?',params[:user][:name]]).exists?
      note='昵称已被注册'
    elsif params[:user][:password]!=params[:user][:password_confirmation]
      note='密码不一致'
    elsif @user.save
        session[:current_user_id]=@user.id
        session[:current_user_name]=@user.name 
      url='/'
    else
       note='未注册成功'
    end

    redirect_to url,notice:note
  end


  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
  def login


    @user=User.new
    respond_to do |format|
      if (session[:current_user_id]==nil)
        format.html {render :layout=>false}
      else
        format.html {redirect_to '/'}
      end
    end
  end
  
  def check
    respond_to do |format|
      #if user=User.authenticate(params[:user][:email],params[:user][:password])
      user=User.find_by_email(params[:user][:email])
      if user && user.authenticate(params[:user][:password])
       session[:current_user_id]=user.id
       session[:current_user_name]=user.name
       curloc=UserCurlocation.where(["user_id=? ",user.id]).order("created_at DESC").first
       if curloc==nil
          session[:current_user_location]=22
       else
          curloc.update_attributes({:inuse=>1})
          session[:current_user_location]=curloc.location_id
       end
       if session[:current_user_location]==nil
          session[:current_user_location]=1
       end
       Juggernaut.publish('online_location_'+session[:current_user_location].to_s,{:name=>user.name,:id=>user.id,:op=>'add'})
        format.html {redirect_to '/home'}
      else
        format.html {redirect_to :action => 'login'}
      end
    end
  end
  def logout
       UserCurlocation.where(:location_id=>session[:current_user_location],:user_id=>session[:current_user_id],:inuse=>1).order('created_at DESC').first.update_attributes({:inuse=>0})
       Juggernaut.publish('online_location_'+session[:current_user_location].to_s,{:name=>session[:current_user_name],:id=>session[:current_user_id],:op=>'del'})
       session[:current_user_id]=nil
       session[:current_user_name]=nil
       session[:current_user_location]=nil
       redirect_to '/login'
  end
end
