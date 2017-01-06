class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #@user = User.find_by(name: user_params[:name])
    @user = User.find_by(name: [params[:user][:name]])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      #binding.pry
      redirect_to user_path(@user)
    else
      flash[:notice] = "Your username or password was incorrect!"
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  # private

  # def user_params
  #   params.require(:user).permit(:name, :password)
  # end



end