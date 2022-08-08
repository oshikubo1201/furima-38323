require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # ユーザー新規登録についてのテストコードを記述します  
      context '新規登録できるとき' do
        it 'nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it 'nicknameが空では登録できない' do
          # nicknameが空では登録できないテストコードを記述します
          user = FactoryBot.build(:user)  # Userのインスタンス生成
          user.nickname = ''  # nicknameの値を空にする
          user.valid?
          expect(user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          # emailが空では登録できないテストコードを記述します
          user = FactoryBot.build(:user)  # Userのインスタンス生成
          user.email = ''  # emailの値を空にする
          user.valid?
          expect(user.errors.full_messages).to include "Email can't be blank"
        end
        it'重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailは@を含まないと登録できない' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'last_nameの記載がないと登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_nameの記載がないと登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_nameに全角（漢字・ひらがな・カタカナ）以外を使用すると登録できない' do
          @user.last_name = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end
        it 'first_nameに全角（漢字・ひらがな・カタカナ）以外を使用すると登録できない' do
          @user.first_name = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it 'last_name_kanaにカタカナ以外を使用すると登録できない' do
          @user.last_name_kana = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end
        it 'first_name_kanaにカタカナ以外を使用すると登録できない' do
          @user.first_name_kana = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it 'last_name_kanaの記載がないと登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'first_name_kanaの記載がないと登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'birthdayの記載がないと登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
  end
end
