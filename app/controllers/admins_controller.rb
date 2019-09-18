#検索機能はできていないです
class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def home
	end
	
	def index
	 @endusers = Enduser.search(params[:search],params[:kennsaku])
    end
end
