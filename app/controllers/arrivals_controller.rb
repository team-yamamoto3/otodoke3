class ArrivalsController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @cds = Cd.all.includes(:artists, :discs, :songs)
  end

  def new
    @cd = Cd.new
    @disc = @cd.discs.build
    @song = @disc.songs.build
    2.times {@cd.artists.build}
    @sales_status = ["販売中", "販売停止中"]
    @selectjenre = ["J-Pop", "K-Pop", "洋楽", "邦楽", "アニメ", "R&B", "ロック", "ハードロック", "パンク",
       "EDM", "ヒップホップ", "レゲエ", "ジャズ", "ハードコア", "クラシック", "演歌"]
  end


  def create
    @cd = Cd.new(cd_params)
    @cd.save
    redirect_to cds_path
  end


  private
  def cd_params
    params.require(:cd).permit(:sales_status, :price, :consumption_tax, :stock, :title, :jacket, :label, :genre,
        artists_attributes:[:artist],
        discs_attributes:[:id, :disc_name, :include, :disc_number, :_destroy,
        songs_attributes:[:id, :song, :songorder, :_destroy]])
  end
end
