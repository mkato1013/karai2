require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user = create(:user)
    @another_user = create(:user)
    @relationship = create(:relationship)
    @another_relationship = build(:relationship)
  end

  describe 'フォロー機能' do
    context 'フォロー関係を保存できる場合' do
      it "following_idとfollower_idがあれば保存できる" do
        expect(@relationship).to be_valid
      end

      it "following_idが同じでもfollower_idが違えばいいねできる" do
        relationship2 = FactoryBot.build(:relationship, follower_id: @another_relationship.follower_id, following_id: @relationship.following_id)
        expect(relationship2).to be_valid
      end

      it "follower_idが同じでもfollowing_idが違えばいいねできる" do
        relationship2 = FactoryBot.build(:relationship, follower_id: @relationship.follower_id, following_id: @another_relationship.following_id)
        expect(relationship2).to be_valid
      end
    end

    context 'フォロー関係を保存できない場合' do
      it "following_idが空では保存できない" do
        @relationship.following_id = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include "Following must exist"
      end

      it "follower_idが空では保存できない" do
        @relationship.follower_id = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include "Follower must exist"
      end

    end
  end
end