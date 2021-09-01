class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to request.referrer || root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id ,food_id: params[:food_id])
  end
end
