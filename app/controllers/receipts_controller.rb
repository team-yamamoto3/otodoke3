class ReceiptsController < ApplicationController

  def create
    #商品購入時
    # addressの輸出先指定
    # 購入枚数減らす。0枚なら返す。その後セーブ
    # カート内デストロイ
    # 住所登録後セーブ（後で）
    @receipt = Receipt.new(receipts_params)
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
    end

    private
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
