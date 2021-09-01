class Food < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_one_attached :image
  has_many :comments

  def self.search(search)
    if search != ""
      Food.where("food_name LIKE(?)", "%#{search}%")
      # Food.where("spicy_level_id LIKE(?)", "%#{search}%")
    else
      Food.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :meal_type
  belongs_to :spicy_level
  belongs_to :shop_mood
  belongs_to :waiting_time

  with_options presence: true do
    validates :image
    validates :shop_name
    validates :food_name
    validates :spicy_level_id
  end
end
