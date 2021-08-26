class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :foods, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_foods, through: :likes, source: :food
  has_one_attached :image
  
  def already_liked?(food)
    self.likes.exists?(food_id: food)
  end
end
