class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

# 検索機能
  def set_search
    @search = Article.ransack(params[:q])
    @search_articles = @search.result.page(params[:page])
  end


  protected
	 def configure_permitted_parameters
	   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email, :user_tell, :user_address, :postal_code])
	 end

   # ログインご画面についてはまた考える
	def after_sign_in_path_for(resource)
	  case resource
      when Enduser
        cds_index_path
      when Admin
        admin_root_path
      end
	end
end

