require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @relationship = FactoryBot.create(:relationship)
  end

  describe 'フォロー機能' do
    context 'フォロー関係を保存できる場合' do
      it "following_idとfollower_idがあれば保存できる" do
        expect(@relationship).to be_valid
      end

      it "following_idが同じでもfollower_idが違えばいいねできる" do
      end

      it "follower_idが同じでもfollowing_idが違えばいいねできる" do
      end
    end

    context 'フォロー関係を保存できない場合' do
      it "following_idが空では保存できない" do
      end

      it "follower_idが空では保存できない" do
      end

      it "following_idとfollower_idが同じ場合では保存できない" do
      end

      it "following_idとfollower_idは一意でなければ保存できない" do
      end

    end
  end
end