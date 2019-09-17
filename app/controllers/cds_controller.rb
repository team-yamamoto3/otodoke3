class CdsController < ApplicationController
  def index
    @cds = Cd.all.includes(:artists)
  end

  def new
    @cd = Cd.new
    2.times {@cd.artists.build}
  end

  def create
    @cd = Cd.new(cd_params)
    @cd.save
    redirect_to 'cds/index'
    # リダイレクト先をpashで表示する
  end

  def show
    @cd = Cd.find(params[:id])
    @price = @cd.price *  @cd.consumption_tax
  end

  def index
    @q = Cd.ransack(params[:q])
    @cds = @q.result(distinct: true)
  end

  def cartin
  end

  private
  def cd_params
    params.require(:cd).permit(:sales_status, :price, :consumption_tax, :stock, :title, :jacket, :label,
        artists_attributes:[:artist])
  end
end
