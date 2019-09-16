class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
	 def configure_permitted_parameters
	   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email, :user_tell, :user_address, :postal_code,:last_name_kana,:first_name_kana])
	 end

 #   # ログインご画面についてはまた考える
	# def after_sign_in_path_for(resource)
	#   case resource
 #      when Enduser
 #        home_root_path
 #      when Admin
 #        home_root_path
 #      end
	# end
end


 