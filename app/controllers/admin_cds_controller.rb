class AdminCdsController < ApplicationController
  def index
    @cds = Cd.all.includes(:artists)
  end

  def new
    @cd = Cd.new
    2.times {@cd.artists.build}
  end

  def create
    @cd = Cd.new(cd_params)
    @cd.save
    redirect_to 'cds/index'
    # リダイレクト先をpashで表示する
  end

  def show
    @cd = Cd.find(params[:id])
  end

  def index
    @q = Cd.ransack(params[:q])
    @cds = @q.result(distinct: true).page(params[:page]).per(5).reverse_order
  end

  def edit
    @cd = Cd.find(params[:id])
    @disc = @cd.discs.build
    @song = @disc.songs.build
    2.times {@cd.artists.build}
    @sales_status = ["販売中", "販売停止中"]
    @selectjenre = ["J-Pop", "K-Pop", "洋楽", "邦楽", "アニメ", "R&B", "ロック", "ハードロック", "パンク",
       "EDM", "ヒップホップ", "レゲエ", "ジャズ", "ハードコア", "クラシック", "演歌"]
  end

  def update
  	@cd = Cd.find(params[:id])
    @cd.update(cd_params)
    if  @cd.save
        redirect_to admin_cd_path(@cd)
        flash[:notice] = "You have updated user successfully."
    else
        flash[:notice] = "更新失敗しました。"
        render :edit
     end
  end

  def destroy
    @cd = Cd.find(params[:id])
    @cd.destroy
    redirect_to admin_cds_path
  end

  private
  def cd_params
    params.require(:cd).permit(:sales_status, :price, :consumption_tax, :stock, :title, :jacket, :label, :genre,
        artists_attributes:[:artist],
        discs_attributes:[:id, :disc_name, :include, :disc_number, :_destroy,
        songs_attributes:[:id, :song, :songorder, :_destroy]])
  end

  def search
  end
end
