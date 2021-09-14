require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname、email、password、password_confirmationが存在すれば登録できる' do
      end

    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        user = User.new(nickname: '',)
      end

      it 'emailが空では登録できない' do
      end

      it '重複したemailが存在する場合登録できない' do
      end

      it 'メールアドレスに@を含める必要がある' do
      end


      it 'passwordとpassword_confirmationが5文字以下であれば登録できない' do
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end

      it 'passwordは半角英語のみでは登録できない' do
      end

      it 'passwordは半角数字のみでは登録できない' do
      end

      it 'passwordは全角英語を含めると登録できない' do
      end

      it 'passwordは全角数字を含めると登録できない' do
      end

      it 'passwordは全角英数混合では登録できない' do
      end
  

    end
  end

end
