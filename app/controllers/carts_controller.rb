class CartsController < ApplicationController
  def index
  	@carts = current_enduser.carts
  end

  def show
  	@carts = current_enduser.carts.all
  end

  def create
  	@cart = Cart.new(cart_params)
  	@cart.enduser_id = current_enduser.id
  	@cart.save
  	redirect_to carts_show_path
  end

  def destroy
  end

  private
  def cart_params
  	params.require(:cart).permit(:cartnumber, :cd_id, :enduser_id )
  end



end
