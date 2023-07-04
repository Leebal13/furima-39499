require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
      #   nickname: 'John',
      #   email: 'john@example.com',
      #   password: 'password123', # Make sure the password is alphanumeric
      #   password_confirmation: 'password123',
      #   first_name: 'John',
      #   last_name: 'Doe',
      #   kana_first_name: 'ジョン',
      #   kana_last_name: 'ドウ',
      #   birthdate: Date.new(1990, 1, 1)
      # )
    end
    
    describe 'ユーザー新規登録' do
        it '必要な情報を適切に入力して「会員登録」ボタンを押すと、ユーザーの新規登録ができること' do
      expect(@user).to be_valid
        end
      context '新規登録できる時' do
        it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
        end
      end
      context '新規登録できない時' do
        it 'ニックネームが空では登録できないこと' do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'メールアドレスが空では登録できないこと' do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'パスワードが空では登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'パスワードとパスワード（確認）が一致しないと登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        # it 'ニックネームが7文字以上では登録できないこと' do
        #   @user.nickname = 'aaaaaaa'
        #   @user.valid?
        #   expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 6 characters)')
        # end
        it '重複したメールアドレスが存在する場合は登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'メールアドレスは@を含まないと登録できないこと' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'パスワードが5文字以下では登録できないこと' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'パスワードが129文字以上では登録できないこと' do
          @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
        end
    end
  end
end
