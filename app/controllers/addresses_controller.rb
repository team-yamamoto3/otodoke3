class AddressesController < ApplicationController
  before_action :authenticate!
  def new
  	  @new_address = Address.new
  end

  def create
  	  @new_address = Address.new(address_params)
  	  @new_address.enduser_id = Enduser.find(params[:enduser_id]).id
      @addresses = Address.all.order(created_at: :desc)
      @enduser = Enduser.find(params[:enduser_id])
      if @new_address.save
         redirect_to enduser_addresses_path(@enduser.id, @new_address.id)
         flash[:notice] = "You have creatad address successfully."
      else
         flash[:frauderror] = "正しく記入してください。"
         render :index
      end
  end

  def index
  	  @new_address = Address.new
  	  @addresses = Enduser.find(params[:id]).addresses.all
      @enduser = Enduser.find(params[:id])
  end

  def show
  end

  def edit
      @enduser = Enduser.find(params[:enduser_id])
      @address = Address.find(params[:id])
  end

  def update
      @address = Address.find(params[:id])
      @address.update!(address_params)
      @enduser = Enduser.find(params[:enduser_id])
      if @address.save
         redirect_to enduser_addresses_path(@enduser.id)
         flash[:notice] = "You have edited address successfully"
      else
        render :edit
      end
  end

  def destroy
  	  @address = Address.find(params[:id])
      @address.destroy
      # flash[:notice] = "successfully"
      redirect_to enduser_addresses_path
  end
private
    def address_params
        params.require(:address).permit(:tell, :postal_code, :address, :enduser_id)
    end
end
