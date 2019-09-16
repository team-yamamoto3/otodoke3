class CdsController < ApplicationController
  def index
  	@cd = Cd.create!
    @cds = Cd.all
  end

  def new
    @cd = Cd.new
  end

  # def create
  #   @cd = Cd.new(cd_params)
  #   @cd.save
  #   redirect_to 'cds/index'
  # end

  def show
    # @cd = Cd.find(params[:id])
  end

  def cartin

  end

  private
  def cd_params
    params.require(:cd).permit(:sale_status, :price, :consumption_tax, :stock, :title, :jacket, :label)
  end

  private
  def cd_params
  	params.require(:cd).permit(:price)
  	
  end
end
