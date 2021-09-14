require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname、email、password、password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"  
      end

      it 'メールアドレスに@を含める必要がある' do
        @user.email = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"  
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordとpassword_confirmationが5文字以下であれば登録できない' do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "000000"
        @user.password_confirmation = "000001"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"  
      end

      it 'passwordは半角英語のみでは登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"  
      end

      it 'passwordは半角数字のみでは登録できない' do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"  
      end

      it 'passwordは全角英数混合では登録できない' do
        @user.password = "０w９i４m"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"  
      end  

    end
  end

end
