class EndusersController < ApplicationController
before_action :authenticate_user!

  def edit
  	  @enduser = Enduser.find(params[:id])
      if @enduser == current_enduser
      else
        redirect_to enduser_path(current_enduser)
      end
  end


  def show
  	  @Cd = Cd.new
      @enduser = Endser.find(params[:id])
      @cds = @enduser.cds.all
  end

  def index
      @Cd = Cd.new
  	  @endusers = Enduser.all.order(created_at: :desc)
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

  private

  def user_params
      params.require(:enduser).permit(:firstnamekanji, :lastnamekanji, :firstnamekana, :lastnamekana, :profile_image, :introduction)
  end
end