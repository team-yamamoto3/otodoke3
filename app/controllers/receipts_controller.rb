class ReceiptsController < ApplicationController

  def create
    #商品購入ボタン後、ここに遷移
    @enduser = current_enduser
    @receipt = Receipt.new(receipts_params)
    @carts = current_enduser.carts.all
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
        #そしてサンクスへ
        redirect_to thanks_cds_path
    end

    private
    def receipts_params
    	params.require(:receipt).permit(:enduser_id, :payment, :order_status, :postage, :house_number, :house, :phone)
    end
   end
