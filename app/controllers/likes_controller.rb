class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(food_id: params[:food_id])
    # @like.save
    # @food = Food.find_by(id: @like.food_id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(food_id: params[:food_id], user_id: current_user.id)
    # @food = Food.find_by(id: @like.food_id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
