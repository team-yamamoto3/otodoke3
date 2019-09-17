class ArrivalsController < ApplicationController
  def new
    @cd = Cd.new
    2.times {@cd.artists.build}
    @sales_status = ["販売中", "販売停止中"]
    @selectjenre = ["J-Pop", "K-Pop", "洋楽", "邦楽", "アニメ", "R&B", "ロック", "ハードロック", "パンク",
       "EDM", "ヒップホップ", "レゲエ", "ジャズ", "ハードコア", "クラシック", "演歌"]
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
    params.require(:cd).permit(:sales_status, :price, :consumption_tax, :stock, :title, :jacket, :label, :genre,
        artists_attributes:[:artist])
  end
end
