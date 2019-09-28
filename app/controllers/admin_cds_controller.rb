class AdminCdsController < ApplicationController
  before_action :authenticate!

  before_action :search

  # def search
  #   @q = Cd.ransack(params[:q])
  #   @cds = @q.result(distinct: true).page(params[:page]).per(10).reverse_order
  # end

  # def set_search
  #   @search = Artist.ransack(params[:q])
  #   @search_artists = @search.result.page(params[:page])
  # end

  def index
      @q = Cd.ransack(params[:q])
      # @cds = Cd.all.includes(:artists, :discs, :songs, :arrivals)
      @cds = @q.result(distinct: true).page(params[:page]).per(3).reverse_order
  end

  def new
    @q = Cd.ransack(params[:q])
    @cds = @q.result(distinct: true)
    @cd = Cd.new
    @disc = @cd.discs.build
    @song = @disc.songs.build
    2.times {@cd.artists.build}
    1.times {@cd.arrivals.build}
    @sales_status = ["販売中", "販売停止中"]
    @selectjenre = ["J-Pop", "K-Pop", "洋楽", "邦楽", "アニメ", "R&B", "ロック", "ハードロック", "パンク",
       "EDM", "ヒップホップ", "レゲエ", "ジャズ", "ハードコア", "クラシック", "演歌"]
    @q = Cd.ransack(params[:q])
    @cds = @q.result(distinct: true).page(params[:page]).per(10).reverse_order
  end

  def create
    @cd = Cd.new(cd_params)
    if @cd.save
    redirect_to admin_cds_path
  else
    flash[:admin_cds_error] = "ジャケット以外に空欄があります。"
    render 'admin_cds/new'
  end
  end

  def show
    @cd = Cd.find(params[:id])

    @cds = Cd.all.includes(:artists, :discs, :songs, :arrival)
    @q = Cd.ransack(params[:q])
    @cds = @q.result(distinct: true).page(params[:page]).per(10).reverse_order

  end


  def edit
    @q = Cd.ransack(params[:q])
    @cds = @q.result(distinct: true)
    @cd = Cd.find(params[:id])
    @sales_status = ["販売中", "販売停止中"]
    @selectjenre = ["J-Pop", "K-Pop", "洋楽", "邦楽", "アニメ", "R&B", "ロック", "ハードロック", "パンク",
       "EDM", "ヒップホップ", "レゲエ", "ジャズ", "ハードコア", "クラシック", "演歌"]
    @q = Cd.ransack(params[:q])
    @cds = @q.result(distinct: true).page(params[:page]).per(10).reverse_order
  end

  def update
  	@cd = Cd.find(params[:id])
    if @cd.update(cd_params)
      p @cd
        flash[:notice] = "You have updated user successfully."
        redirect_to admin_cd_path(@cd)
    else
        flash[:notice] = "更新失敗しました。"
        render :edit
     end
  end

  def destroy
    @cd = Cd.find(params[:id])
    @cd.destroy
    # flash[:notice] = "successfully"
    redirect_to admin_cds_path
  end

  private
  def cd_params
    params.require(:cd).permit(:sales_status, :price, :consumption_tax, :stock, :title, :jacket, :label, :genre,
        artists_attributes:[:id, :artist],
        discs_attributes:[:id, :disc_name, :include, :disc_number, :_destroy,
        songs_attributes:[:id, :song, :songorder, :_destroy]])
  end

end
