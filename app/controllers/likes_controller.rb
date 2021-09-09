class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @food = Food.find(params[:food_id])
    @like = current_user.likes.create(food_id: params[:food_id])
  end

  def destroy
    @food = Food.find(params[:food_id])
    @like = Like.find_by(food_id: params[:food_id],user_id: current_user.id)
    @like.destroy
  end
end
