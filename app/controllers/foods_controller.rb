class FoodsController < ApplicationController

  before_action :search_product, only: [:index, :search]

  def index
    to = Time.current.at_beginning_of_day
    from = (to - 1.week)
    @foods = Food.order("created_at DESC").where(user_id: [current_user.id,*current_user.following_ids]).where(created_at: from...to)
    @like = Like.new
    @ranks = Food.find(Like.group(:food_id).order('count(food_id) desc').limit(5).pluck(:food_id))
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
    @foods = Food.search(params[:keyword])
    @results = @p.result.includes(:spicy_level)
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
    @comments = @food.comments
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

  def search_product
    @p = Food.ransack(params[:q])
  end

end
