class CdsController < ApplicationController
  # before_action :authenticate_user!, except:[:index, :show, :search, :thanks]
  # before_action :check_account

  def index
    # @cds = Cd.all.includes(:artists, :discs, :songs)
    # @cds = Cd.page(params[:page]).per(2)
    @q = Cd.ransack(params[:q])
    @cds = @q.result(distinct: true).page(params[:page]).per(2).reverse_order
  end

  def new
    @cd = Cd.new
    # 2.times {@cd.artists.build}
  end

  def create
    @cd = Cd.new(cd_params)
    @cd.save
    redirect_to 'cds/index'
  end

  def show
    @cd = Cd.find(params[:id])
    @price = @cd.price *  @cd.consumption_tax
    @cart = Cart.new
    
  end

  def cartin
  end

  def thanks
  end

  private
  def cd_params
    params.require(:cd).permit(:sales_status, :price, :consumption_tax, :stock, :title, :jacket, :label, :genre,
        artists_attributes:[:artist],arrivals_attributes:[:arrival_new, :arrival_day],
        discs_attributes:[:id, :disc_name, :include, :disc_number, :_destroy,
        songs_attributes:[:id, :song, :songorder, :_destroy]])
  end
end
