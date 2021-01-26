require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it "nameが空では登録できないこと" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザー名を入力してください")
      end



      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it "emailが@を含まないと保存ができないこと" do
        @user.email = "stest.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      


      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
  
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'password:数字のみでは登録できない' do
        @user.password = 111111
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'password:英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'password:全角では登録できない' do
        @user.password = 'アアアアアア'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end  
    end
  end
end