class CdsController < ApplicationController
  def index
    @cds = Cd.all
  end

  def show
    @cds = Cd.find(params[:id])
  end

  def cartin

  end

  private
  def cds_params
    params.require(:cd).permit(:label, :genre)
  end
end
