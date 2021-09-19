require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = create(:user)
    food = create(:food)
    @comment = build(:comment, user_id: user.id, food_id: food.id)
    sleep 0.2
  end

  describe 'コメント機能' do
    context 'コメントを保存できる場合' do
      it "コメント文を入力済みであれば保存できる" do
        expect(@comment).to be_valid
      end
    end

    context 'コメントを保存できない場合' do
      it "コメントが空では投稿できない" do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Text can't be blank"
      end

      it "ユーザーがログインしていなければコメントできない" do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "User must exist"
      end

      it "投稿したものがなければコメントできない" do
        @comment.food_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Food must exist"
      end

    end
  end
end