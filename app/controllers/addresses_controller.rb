class AddressesController < ApplicationController

  def new
  	  @new_address = Address.new
  end

  def create
  	  @new_address = Address.new(address_params)
  	  @new_address.enduser_id = current_enduser.id
      @addresses = Address.all.order(created_at: :desc)
      @enduser = current_enduser
      if @new_address.save
         redirect_to enduser_addresses_path(@enduser)
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
      @enduser = current_enduser
  end

  def update
      @address = Address.find(params[:id])
      @address.update(address_params)
      if @address.save
         redirect_to enduser_addresses_path(@address)
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
