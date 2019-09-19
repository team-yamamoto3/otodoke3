class CartsController < ApplicationController
  def index
    @carts = current_enduser.carts.all
  end

  def show
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
  end


  private
  def cart_params
  	params.require(:cart).permit(:cartnumber, :cd_id, :enduser_id, :cartnumber)
  end
end
