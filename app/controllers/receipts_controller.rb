class ReceiptsController < ApplicationController

  def create
     @carts = current_enduser.carts
     @receipt = Receipt.new(receipts_params)
      @carts.each do |cart|
    #カートから購入CDを一枚ずつ取り出し、買った枚数の方が多ければrender。
    if cart.cd.stock < cart.cartnumber
       flash[:buyerror] = "SORRY SOLD! #{cart.cd.title}"
       redirect_to carts_index_path
       return
    else
        # 購入枚数分在庫減らす。
       cart.cd.stock > cart.cartnumber
       cart.cd.stock -= cart.cartnumber
       cart.save #いる？
       #在庫減らしたので、この段階でデータ保存
       cart.cd.save
       # 購入金額計算して合計金額カラムに代入
       total = cart.cd&.price * cart.cd&.consumption_tax
       totaled = total.floor * cart.cartnumber
       @receipt.sum_price = totaled
     end
    end
    #レシートセーブ。each分の中にかくと毎回セーブの挙動が起きるのでeach外でセーブ
        @receipt.save
        @carts.each do |cart|
          @order = Order.new
          @order.cd_id = cart.cd.id
          @order.order_number = cart.cartnumber
          @order.receipt_id = @receipt.id
          @order.save
          # カート内デストロイ
          cart.destroy
        end
        # @cart = current_enduser.carts
        redirect_to thanks_cds_path
    end

    def index
      @receipts = Receipt.page(params[:page]).per(10)
      @orders = Order.all
    end

    def show
      @receipt = Receipt.find(params[:id])
    end

    def update
      @receipt = Receipt.find(params[:id])
      @receipt.update!(receipt_params)
      if @receipt.save
         redirect_to receipts_path
      else
        render :index
      end
    end

    private
    def receipts_params
    	params.require(:receipt).permit(:enduser_id, :payment, :order_status, :postage, :house_number, :house, :phone ,:order_id)
    end
    def receipt_params
      params.require(:receipt).permit(:order_status)
    end
  end
