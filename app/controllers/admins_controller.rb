class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def home
	end
	
	def index
      @q = Enduser.ransack(params[:q])
      @endusers = @q.result(distinct: true)
      #binding.pry
    end
end
