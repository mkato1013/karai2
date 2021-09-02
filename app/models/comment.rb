class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :text, presence: true

end
