class ArrivalsController < ApplicationController
  def new
    @cd = Cd.new
    @sales_status = ["販売中", "販売停止中"]
    @selectjenre = ["J-Pop", "K-Pop", "洋楽", "邦楽", "アニメ", "R&B", "ロック", "ハードロック", "パンク",
       "EDM", "ヒップホップ", "レゲエ", "ジャズ", "ハードコア", "クラシック", "演歌"]
  end

  def create
    @cd = Cd.new(cd_params)
    @cd.save
    redirect_to cds_path
  end

  def index
  end

  private
  def cd_params
    params.require(:cd).permit(:sale_status, :price, :consumption_tax, :stock, :title, :jacket, :label)
  end
end
