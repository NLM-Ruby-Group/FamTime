class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def authenticate_user
    if current_user.nil? 
      redirect_to root_path 
    end
  end

  def current_user
    return @current_user if @current_user

    if session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
    else
      @current_user = nil
    end
  end

  def require_user
    unless current_user 
      redirect_to new_session_path , flash: {error: "Please Log In"}
    end
  end

  def redirect_if_unverified
    if current_user && current_user.phone_number.nil? || !current_user.phone_number.verified?
      redirect_to new_phone_number_path, notice: "Please verify your phone number"
    end      
  end
end
