class ReceiptsController < ApplicationController

  def create
    #商品購入時
    # addressの輸出先指定（まだ）
    # 購入枚数減らす。0枚以下なら返す。その後セーブ
    # カート内デストロイ
    # 住所登録後セーブ（後で）
    @receipt = Receipt.new(receipts_params)
    @carts = current_enduser.carts.all
    @carts.each do |cart|
    if cart.cd.stock < cart.cartnumber
       flash[:buyerror] = "完売商品があります。申し訳ありません"
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
        # @cart = current_enduser.carts
        binding.pry
        redirect_to thanks_cds_path
    end

    private
    def receipts_params
    	params.require(:receipt).permit(:enduser_id, :payment, :order_status, :postage, :house_number, :house, :phone)
    end
   end
