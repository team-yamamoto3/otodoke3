class OrdersController < ApplicationController
before_action :authenticate!
  def index
  	@orders = Order.all
  	@cd = Cd.find(params[:id])
  end

  def show
  end
end
