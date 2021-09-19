require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    user = create(:user)
    food = create(:food)
    @like = build(:like, user_id: user.id, food_id: food.id)
    sleep 0.2
  end

  describe 'いいね機能' do
    context 'いいねできる場合' do
      it "user_idとfood_idがあれば保存できる" do
        expect(@like).to be_valid
      end

      it "food_idが同じでもuser_idが違えばいいねできる" do
        another_like = FactoryBot.create(:like)
        expect(FactoryBot.create(:like, user_id: another_like.user_id)).to be_valid
      end

      it "user_idが同じでもfood_idが違えばいいねできる" do
        another_like = FactoryBot.create(:like)
        expect(FactoryBot.create(:like, food_id: another_like.food_id)).to be_valid
      end
    end

    context 'いいねできない場合' do
      it "user_idが空ではいいねできない" do
        @like.user_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include "User must exist"
      end

      it "food_idが空ではいいねできない" do
        @like.food_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include "Food must exist"
      end
    end
  end
end