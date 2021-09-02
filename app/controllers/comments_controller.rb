class CommentsController < ApplicationController
  def create
    @food = Food.find(params[:food_id])
    @comment = Comment.create(comment_params)
    @comments = @food.comments
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id ,food_id: params[:food_id])
  end
end
