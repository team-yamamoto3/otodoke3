class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    home_path
  end

 protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email, :user_tell, :user_address, :postal_code])
 end

   # ログインご画面についてはまた考える
	def after_sign_in_path_for(resource)
	    enduser_path(current_enduser.id)
	    if resouce_or_scope.is_a?(Admin)
	       home_path
	    else
	    	cds_index_path
	    end
	end
end
