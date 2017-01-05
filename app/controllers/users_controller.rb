class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user #@user.errors?
      session[:user_id] = @user.id
      # binding.pry
      redirect_to user_path(@user)
    else 
      flash[:notice] = "Failed to create your user account."
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end
end