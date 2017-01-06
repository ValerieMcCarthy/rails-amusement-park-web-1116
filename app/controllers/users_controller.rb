class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    
    @user = User.new(user_params)
    if password_exists && @user.save #@user.errors?
      session[:user_id] = @user.id
      # binding.pry
      redirect_to user_path(@user)
    else 
      flash[:notice] = "Failed to create your user account."
      redirect_to root_path
    end
  end

  def show
   
    @user = User.find(params[:id])
    if session[:user_id] != params[:id].to_i
      redirect_to root_path and return
    end
  end

private

  def password_exists
    @user.password
  end

  def user_params
    # params.require(user.password)
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
    
  end
end