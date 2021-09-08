class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @user = User.find(params[:user_id])
    following = Relationship.create(follower_id: params[:user_id], following_id: current_user.id)
  end

  def destroy
    @user = User.find(params[:user_id])
    following = Relationship.find_by(follower_id: params[:user_id], following_id: current_user.id)
    following.destroy
  end
end
