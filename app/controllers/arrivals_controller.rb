class ArrivalsController < ApplicationController
  def new
    @cd = Cd.new
    @sales_status = ["販売中", "販売停止中"]
  end

# これはarrivalsのテーブルにCDを保存しているためコメントアウト
  def create
    @cd = Cd.new(cd_params)
    @cd.save
    redirect_to cds_path
  end

  def index
  end

  private
  def cd_params
    params.require(:cd).permit(:sale_status, :price, :consumption_tax, :stock, :title, :jacket, :label, :genre)
  end
end
