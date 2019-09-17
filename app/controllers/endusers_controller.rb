class EndusersController < ApplicationController
# before_action :authenticate_user!


  def edit
  	  @enduser = Enduser.find(params[:id])
      if @enduser == current_enduser
      else
        redirect_to enduser_path(current_enduser)
      end
  end


  def show
      @enduser = current_enduser
  end

  def new
  end

  def update
      @enduser = Enduser.find(params[:id])
      @enduser.update(enduser_params)
      if @enduser.save
        flash[:notice] = "You have updated user successfully."
        redirect_to enduser_path(@enduser.id)
      else
      	render :edit
      end
  end

  def destroy
      Enduser.find(params[:id]).destroy
      flash[:success] = "Enduser deleted"
      redirect_to cds_index_path
  end

  

  private
  def user_params
      params.require(:enduser).permit(:first_name, :last_name, :first_name_kana, :last_name_kana)
  end

end