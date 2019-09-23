class CartsController < ApplicationController
  def index
    @carts = current_enduser.carts.all
    @cds = Cd.all.includes(:artists, :discs, :songs)
  end

  def show
    # @cart = Cart.find(params[:id])
    # @cart.enduser_id = current_enduser.id
    # @cd.cd_id = @cd.id
    @daibiki = true
    @carts = current_enduser.carts.all
    @enduser = current_enduser
    @receipt =Receipt.new
    # @price = @cd.price * @cd.consumption_tax
  end

  def create
  	@cart = Cart.new(cart_params)
    # binding.pry
  	@cart.enduser_id = current_enduser.id
  	@cart.save
  	redirect_to carts_index_path
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
