class UsersController < ApplicationController

  def show
    food = Food.find(params[:id])
    user = User.find(food.user.id)
    @nickname = user.nickname
    @foods = user.foods
  end

end
