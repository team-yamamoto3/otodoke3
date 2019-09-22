class CartsController < ApplicationController
  def index
    @carts = current_enduser.carts.all
    @cds = Cd.all.includes(:artists, :discs, :songs)
  end

  def show

    # @cart = Cart.find(params[:id])
    # @cart.enduser_id = current_enduser.id
    # @cd.cd_id = @cd.id
    @carts = current_enduser.carts.all
    # @price = @cd.price * @cd.consumption_tax
  end

  def buy
    @receitpt = Receipt.new(receipts_params)

    if @cd.stocks.count < sumcds
       flash[:buyerror] = "完売商品があります。申し訳ありません"
       render "carts/index"
    else @cd.stocks.count > sumcds
       @cd.stock -= sumcds
    if @cd.save
        @receipt.sum_price += totaled
      if  @receipt.save
        cart = Cart.find(params[:id])
        cart.destroy
        redirect_to thanks_cds_path
      else
        flash[:saveerror] = "すいません"
        render "carts/index"
       end
      end
    end
    # addressの輸出先指定
    # 購入枚数減らす。0枚なら返す。その後セーブ
    # カート内デストロイ
    # 住所登録後セーブ（後で）
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
  def receipts_params
  	params.require(:receipt).permit(:order_status, :payment, :postage, :sum_price)
  end

  def totaled
	  @carts.each do |cart|
		total = cart.cd&.price * cart.cd&.consumption_tax
		totaled = total.floor * cart.cartnumber
   end
	end
  def sumcds
	  @carts.each do |cart|
     sumcds = cart.cd * cart.cartnumber
	  end
	end
 end
