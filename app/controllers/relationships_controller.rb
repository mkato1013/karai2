class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    following = Relationship.create(follower_id: params[:user_id], following_id: current_user.id)
    redirect_to request.referrer || root_path
  end

  def destroy
    following = Relationship.find_by(follower_id: params[:user_id], following_id: current_user.id)
    following.destroy
    redirect_to request.referrer || root_path
  end
end
