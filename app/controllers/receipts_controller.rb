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
      #カートから購入CDを一枚ずつ取り出し、買った枚数の方が多ければrender。
    if cart.cd.stock < cart.cartnumber

       flash[:buyerror] = "SORRY SOLD! #{cart.cd.title}"
       #同じ数ならおけ？
       # render "carts/index"
       redirect_to carts_index_path
       return
    else
        # 購入枚数分在庫減らす。
       cart.cd.stock > cart.cartnumber
       cart.cd.stock -= cart.cartnumber
       cart.save #いる？
       cart.cd.save #在庫減らしたので、この段階でデータ保存
       # 購入金額計算して合計金額カラムに代入
       total = cart.cd&.price * cart.cd&.consumption_tax
       totaled = total.floor * cart.cartnumber
       @receipt.sum_price = totaled
         # カート内デストロイ
       cart.destroy
     end
    end
    #レシートセーブ。each分の中にかくと毎回セーブの挙動が起きるのでeach外でセーブ
        @receipt.save
        @order.receipt_id = @receipt.id
        @order.save
        # @cart = current_enduser.carts
        #そしてサンクスへ
        redirect_to thanks_cds_path
    end

    private
    def receipts_params
    	params.require(:receipt).permit(:enduser_id, :payment, :order_status, :postage, :house_number, :house, :phone ,:order_id)
    end
   end
