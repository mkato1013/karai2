class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    # @food = Food.find_by(user_id:current_user.id)
    @foods = @user.foods.order("created_at DESC")
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def edit
    @user = User.find(params[:id])
    return redirect_to user_path if current_user.id != @user.id
  end

  def update
    @user = User.find(params[:id])
    return redirect_to user_path if current_user.id != @user.id

    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:icon, :nickname, :email, :introduction)
  end

end
