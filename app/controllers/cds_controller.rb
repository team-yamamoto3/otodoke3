class CdsController < ApplicationController
  def index
  end

  def show
    @cds = Cd.find(params[:id])
  end

  private
  # def cds_params
  #   params.require(:cd).permit(:label, :price, :genre)
  # end
end
