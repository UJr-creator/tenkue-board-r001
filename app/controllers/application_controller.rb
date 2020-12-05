class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user
  before_action :authenticate_user

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end
    
    def authenticate_user
      if @current_user == nil
      redirect_to("/posts/index")  
    end
  end
  
  end

