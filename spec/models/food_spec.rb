require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @food = FactoryBot.build(:food)
  end

  describe '辛い食べ物投稿機能' do
    context '内容に問題がない場合' do
      it '食べ物画像、店名、メニュー名、辛さレベルが存在すれば登録できる' do
        expect(@food).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '食べ物画像が空では登録できない' do
        @food.image = nil
        @food.valid?
        expect(@food.errors.full_messages).to include "Image can't be blank"
      end

      it '店名が空では登録できない' do
        @food.shop_name = ''
        @food.valid?
        expect(@food.errors.full_messages).to include "Shop name can't be blank"
      end

      it 'メニュー名が空では登録できない' do
        @food.food_name = ''
        @food.valid?
        expect(@food.errors.full_messages).to include "Food name can't be blank"
      end

      it '辛さレベルが空では登録できない' do
        @food.spicy_level_id = nil
        @food.valid?
        expect(@food.errors.full_messages).to include "Spicy level can't be blank"
      end

      it 'ログインしているユーザーでなければ投稿できない' do
        @food.user = nil
        @food.valid?
        expect(@food.errors.full_messages).to include "User must exist"
      end
    end
  end
end