class AdminsController < ApplicationController
	before_action :authenticate!
	def home
	end

	def index
	 @endusers = Enduser.search(params[:search],params[:kennsaku])
    end
end
