class CdsController < ApplicationController
  def index
    @cds = Cd.all.includes(:artists)
  end

  def new
    @cd = Cd.new
    2.times {@cd.artists.build}
  end

  # def create
  #   @cd = Cd.new(cd_params)
  #   @cd.save
  #   redirect_to 'cds/index'
  # end

  def show
    @cd = Cd.find(params[:id])
  end

  def cartin

  end

  private
  def cd_params
    params.require(:cd).permit(:sales_status, :price, :consumption_tax, :stock, :title, :jacket, :label,
        artists_attributes:[:artist])
  end

end
