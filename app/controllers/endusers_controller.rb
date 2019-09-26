class EndusersController < ApplicationController
#before_action :authenticate!

  PER = 3


  def show
      @enduser = Enduser.find(params[:id])
      @receipts = Enduser.find(params[:id]).receipts.page(params[:page]).per(PER).reverse_order
  end

  def history
      @enduser = current_enduser
      @receipts = current_enduser.receipts.page(params[:page]).per(PER).reverse_order
  end

  def edit
  	  @enduser = Enduser.find(params[:id])
      if @enduser == current_enduser
      elsif admin_signed_in?
      else
        redirect_to enduser_path(current_enduser)
      end
  end

  def new
  end

  def update
      @enduser = Enduser.find(params[:id])
      if @enduser.update(enduser_params)
         redirect_to enduser_path(@enduser.id)
      else
        flash.now[:alert] = "正しく記入してください。"
      	render :edit
      end
  end

  def destroy
      Enduser.find(params[:id]).destroy
    if enduser_signed_in?
      redirect_to cds_index_path
    else
      redirect_to home_path
    end
  end

  private
  def enduser_params
      params.require(:enduser).permit(:first_name, :last_name, :last_name_kana,:first_name_kana, :postal_code, :user_address, :user_tell, :email)
  end

end
