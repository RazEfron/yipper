class Api::UsersController < ApplicationController
    def index
    @users = User.all
    render json: @users
  end

  def show
    
    @user = User.find(params[:id])
    render :show
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render :show
    else
      render json: ['something went wrong'], status: 422
    end
  end 

  private
  def user_params
    params.require(:user).permit(:username, :password)
end
