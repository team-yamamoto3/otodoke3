class AddressesController < ApplicationController

  def new
  	  @new_address = Address.new
  end

  def create
  	  @address = Address.new(address_params)
  	  @address.enduser_id = current_enduser.id
      @addresses = Address.all.order(created_at: :desc)
      @enduser = current_enduser
      if @address.save
         redirect_to enduser_addresses_path(@address)
         flash[:notice] = "You have creatad address successfully."
      else
         render :index
      end
  end

  def index
  	  @new_address = Address.new
  	  @addresses = current_enduser.addresses.all
      @enduser = current_enduser
  end

  def show
  end

  def edit
      @address = Address.find(params[:id])
  end

  def update
      @address = Address.find(params[:id])
      @address.update(address_params)
      if @address.save
         redirect_to enduser_addresses_path(@address)
         flash[:notice] = "You have edited book successfully"
      else
        render :edit
      end
  end

  def destroy
  	  @address = Adrress.find(params[:id])
      @address.destroy
      # flash[:notice] = "successfully"
      redirect_to enduser_addresses_path
  end
private
    def address_params
        params.require(:address).permit(:tell, :postal_code, :address, :enduser_id)
    end
end
