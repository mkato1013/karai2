require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do
    context 'コメントを保存できる場合' do
      it "コメント文を入力済みであれば保存できる" do
        expect(@comment).to be_valid
      end

    context 'コメントを保存できない場合' do
      it "コメントが空では投稿できない" do
      end

      it "ユーザーがログインしていなければコメントできない" do
      end

      it "投稿したものがなければコメントできない" do
      end

    end
  end
end