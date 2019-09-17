class ArrivalsController < ApplicationController
  def new
    @cd = Cd.new
    @discs = Disc.new
    2.times {@cd.artists.build}
    2.times {@cd.songs.build}
    # 2.times {.discs.build}
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
    params.require(:cd).permit(:sales_status, :price, :consumption_tax, :stock, :title, :jacket, :label, :genre,
        artists_attributes:[:artist],
         songs_attributes:[:songs],
        discs_attributes:[:discs])
  end

end
