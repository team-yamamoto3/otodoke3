class EndusersController < ApplicationController
# before_action :authenticate_user!


  def show
      @enduser = current_enduser
  end

  def edit
  	  @enduser = Enduser.find(params[:id])
      if @enduser == current_enduser
      else
        redirect_to enduser_path(current_enduser)
      end
  end

  def new
  end

  def update
      @enduser = Enduser.find(params[:id])
      if @enduser.update(enduser_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to enduser_path(@enduser.id)
      else
        flash[:notice] = "更新失敗しました。"
      	render :edit
      end
  end

  def destroy
      Enduser.find(params[:id]).destroy
      flash[:success] = "Enduser deleted"
      redirect_to cds_index_path
  end

  private
  def enduser_params
      params.require(:enduser).permit(:first_name, :last_name, :last_name_kana,:first_name_kana, :postal_code, :user_address, :user_tell, :email)
  end

end
