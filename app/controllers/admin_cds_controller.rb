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
    @cds = @q.result(distinct: true)
  end

  def edit
    @cd = Cd.find(params[:id])
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

  def destory
  end

  private
  def cd_params
    params.require(:cd).permit(:sales_status, :price, :consumption_tax, :stock, :title, :jacket, :label,
        artists_attributes:[:artist])
  end

  def search
  end
end
