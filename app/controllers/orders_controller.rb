class OrdersController < ApplicationController
  def index
  	@orders = Order.all
  	@cd = Cd.find(params[:id])
  end

  def show
  end
end
