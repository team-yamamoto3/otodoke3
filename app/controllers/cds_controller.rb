class CdsController < ApplicationController
  def index
  	@cd = Cd.create!
  end

  def show
  end

  private
  def cd_params
  	params.require(:cd).permit(:price)
  	
  end
end
