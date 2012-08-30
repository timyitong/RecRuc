class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_session
  def check_session
  	if (session[:current_user_id]==nil)
  		redirect_to '/login'
  	end
  end
end
