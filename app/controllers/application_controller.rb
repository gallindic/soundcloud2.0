class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 
  
  # call the configured params 
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :application
  
  
  # protect the database, while allowing these fields to be updated.
  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :image, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username, :email, :image, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :image, :password, :password_confirmation, :current_password) }
  end
  
<<<<<<< HEAD
  def application
  @allMusics = Music.all.count
  @userMusic = Music.where("user_id = ?", current_user.id).count
  @userMusic = "Profile(" + @userMusic.to_s + ")"
  
=======
  
  def application
    @allMusics = Music.all.count
    @userMusic = Music.where("user_id = ?", current_user.id).count
    @userMusic = "Profile(" + @userMusic.to_s + ")"
>>>>>>> 1f1f2e5a9ef58a506222f42099684b180a7de2bc
  end
end
