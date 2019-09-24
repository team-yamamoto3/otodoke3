class ReceiptsController < ApplicationController

  def create
    #商品購入時
    # addressの輸出先指定（まだ）
    # 購入枚数減らす。0枚以下なら返す。その後セーブ
    # カート内デストロイ
    # 住所登録後セーブ（後で）
    @carts = current_enduser.carts
    @carts_a = Cart.find_by(enduser_id: current_enduser.id)
    @order = Order.new
    @order.order_number = @carts_a.cartnumber
    @order.cd_id = @carts_a.cd_id
    @receipt = Receipt.new(receipts_params)
    @receipt.order_id = @order.id
    @carts.each do |cart|
    if cart.cd.stock < cart.cartnumber
       flash[:buyerror] = "完売商品があります。申し訳ありません。"
       #同じ数ならおけ？
       render "carts/index"
       return
    else
       cart.cd.stock > cart.cartnumber
       cart.cd.stock -= cart.cartnumber
       cart.save #いる？
       cart.cd.save
       total = cart.cd&.price * cart.cd&.consumption_tax
       totaled = total.floor * cart.cartnumber
       @receipt.sum_price = totaled
       cart.destroy
     end
    end
        @receipt.save
        @order.receipt_id = @receipt.id
        @order.save
        # @cart = current_enduser.carts
        redirect_to thanks_cds_path
    end

    private
    def receipts_params
    	params.require(:receipt).permit(:enduser_id, :payment, :order_status, :postage, :house_number, :house, :phone ,:order_id)
    end
   end
