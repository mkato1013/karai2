class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @nickname = user.nickname
    # @foods = user.foods
    # @image = user.image
    # @introduction = user.introduction
  end

  # private

  # def user_params
  #   params.require(:user).permit(:image, :nickname, :introduction)
  # end

end
