class ApplicationController < ActionController::Base
   before_action :authenticate_user!,except: [:top, :about]
   before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :correct_user,only: [:edit]

  protected
  def after_sign_in_path_for(resouce)
    users_path
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
  end

  def correct_user
     @user = User.find(params[:id])
     if @user != current_user
      redirect_to user_path(current_user)
     end
  end

end
