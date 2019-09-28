class ArrivalsController < ApplicationController
   before_action :authenticate_admin!
  def history
    @arrivals = Arrival.page(params[:page]).per(10)
    @cds = Cd.all.includes(:artists, :discs, :songs, :arrival)
  end

  def index
    @cds = Cd.all.includes(:artists, :discs, :songs, :arrivals)
    @arrivals = Arrival.all
  end

  def new
    @arrival = Arrival.new
    @cd = Cd.find(params[:cd_id])
  end

  def create
    @cd = Cd.find(params[:cd_id])
    #current_adminだけが入荷できるようにするにはcurrent_admin.arrivals.new(arrival_params)?
    @arrival = Arrival.new(arrival_params)
    @arrival.cd_id = @cd.id
    if @arrival.save
    @cd.stock += @arrival.arrival_new
    @cd.save
    # redirect_to cd_arrivals_path(@cd)
    redirect_to admin_cd_path(@cd)
  else
    flash[:blankerror] = "空欄があります。"
    render 'arrivals/new'
  end
  end

  def show
     @cd = Cd.find(params[:cd.id])
  end

  def edit
    @cd = Cd.find(params[:cd_id])
  end

  def destroy

  end

  private
  def cd_params
    params.require(:cd).permit(:sales_status, :price, :consumption_tax, :stock, :title, :jacket, :label, :genre,
        artists_attributes:[:id, :artist],
        discs_attributes:[:id, :disc_name, :include, :disc_number, :_destroy,
        songs_attributes:[:id, :song, :songorder, :_destroy]])
  end
  def arrival_params
    params.require(:arrival).permit(:arrival_new, :arrival_day)
  end
end
