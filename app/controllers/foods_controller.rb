class FoodsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search, :show]

  def index
    to = Time.current
    from = (to - 1.week)
    user = current_user
    if user.present? && user.following_ids.present?
      @foods = Food.order("created_at DESC").where(user_id: [current_user.id,*current_user.following_ids]).where(created_at: from...to)
    else
      @foods = Food.order("created_at DESC").where(created_at: from...to).limit(25)
    end
    @like = Like.new
    @ranks = Food.find(Like.group(:food_id).order('count(food_id) desc').limit(5).pluck(:food_id))
    @q = Food.ransack(params[:q])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    @q = Food.ransack(params[:q]) || User.ransack(params[:q])
    @foods = @q.result.order("created_at DESC").limit(25)
  end

  def edit
    @food = Food.find(params[:id])
    return redirect_to user_path if current_user.id != @food.user.id
  end

  def update
    @food = Food.find(params[:id])
    return redirect_to user_path if current_user.id != @food.user.id
    if @food.update(food_params)
      redirect_to user_path(@food.user_id)
    else
      render :edit
    end
  end

  def show
    @food = Food.find(params[:id])
    @like = Like.new
    @comment = Comment.new
    @comments = @food.comments.order("created_at DESC")
  end

  def destroy
    @food = Food.find(params[:id])
    return redirect_to user_path if current_user.id != @food.user.id
    @food.destroy
    redirect_to user_path(@food.user_id)
  end

  private

  def food_params
    params.require(:food).permit(:image, :meal_type_id, :shop_name, :shop_name_kana, :food_name, :spicy_level_id, :station, :shop_mood_id, :waiting_time_id, :food_comment).merge(user_id: current_user.id)
  end

end
