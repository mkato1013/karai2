require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe 'いいね機能' do
    context 'いいねできる場合', js: true do
      it "user_idとfood_idがあれば保存できる" do
        expect(@like).to be_valid
      end

      it "food_idが同じでもuser_idが違うといいねできる" do
        expect(FactoryBot.create(:like, user_id: @like.user_id)).to be_valid
      end

      it "user_idが同じでもfood_idが違うといいねできる" do
        expect(FactoryBot.create(:like, food_id: @like.food_id)).to be_valid
      end

    end

    context 'いいねできない場合',js: true do
      it "user_idが空ではいいねできない" do
        @like.user_id = nil
        @like.valid?
        expect(@like.errors[:user_id]).to include 
      end

      it "food_idが空ではいいねできない" do
        @like.food_id = nil
        @like.valid?
        expect(@like.errors[:food_id]).to include 
      end

      it 'ログインしているユーザーでなければいいねできない' do
        @like.user_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include "User must exist"
      end

      it '投稿した食べ物がなければいいねできない' do
        @like.food_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include "Food must exist"
      end
    end
  end
end