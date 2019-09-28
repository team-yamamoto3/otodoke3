class CartsController < ApplicationController
  before_action :authenticate!
  def index
    @carts = current_enduser.carts.all
    @cds = Cd.all.includes(:artists, :discs, :songs)
  end

  def show
    # @cart = Cart.find(params[:id])
    # @cart.enduser_id = current_enduser.id
    # @cd.cd_id = @cd.id
    @new_address = Address.new
    @addresses = current_enduser.addresses.all
    # @addresses = Address.all.order(created_at: :desc)
    @daibiki = true
    @carts = current_enduser.carts.all
    @enduser = current_enduser
    @receipt =Receipt.new
    # @price = @cd.price * @cd.consumption_tax

    # カートの中身が０の時、CDindex画面に遷移
    if @carts.blank?
       flash.now[:alert] = "カートに商品が御座いません。"
       render :index
    end
  end

  def create
  	@cart = Cart.new(cart_params)
    @cd = Cd.find(params[:cart][:cd_id])
    carts = current_enduser.carts.all
    # binding.pry
  	@cart.enduser_id = current_enduser.id
    # 同じCDが入った時に数量のみが変更される
    if @cd.cart_by?(current_enduser.id, @cd.id)
      exist_cart = carts.find_by(cd_id: @cd.id)
      new_number = exist_cart.cartnumber + 1
      exist_cart.update(cartnumber: new_number)
      redirect_to carts_index_path
    else @cart.save
  	redirect_to carts_index_path
    end
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_index_path
  end

  def update
    @cartnumber = Cart.find(params[:id])
    @cartnumber.update(cart_params)
    redirect_to "/carts/index"
  end

  private
  def cart_params
  	params.require(:cart).permit(:cartnumber, :cd_id, :enduser_id, :cart)
  end
 end
