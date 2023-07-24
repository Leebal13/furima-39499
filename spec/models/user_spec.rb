require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '必要な情報を適切に入力して「会員登録」ボタンを押すと、ユーザーの新規登録ができること' do
        expect(@user).to be_valid
      end

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

      it '姓（全角）が空だと登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名（全角）が空だと登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '姓（カナ）が空だと登録できないこと' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end

      it '名（カナ）が空だと登録できないこと' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      it '生年月日が空だと登録できないこと' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'fatherlala'
        @user.password_confirmation = 'fatherlala'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 検証できない")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 検証できない")
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ママ'
        @user.password_confirmation = 'ママ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 検証できない")
      end

      it '重複したメールアドレスが存在する場合は登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
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

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'KyawMinHein'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name must be full-width characters")
      end

      it '名（全角）に半角文字が含まれていると登録できないこと' do
        @user.first_name = 'KyawGyi'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name must be full-width characters")
      end

      it '姓(カナ)にカタカナ以外の文字(平仮名・漢字・英数字・記号)が含まれていると登録できないこと' do
        @user.kana_last_name = '鈴木'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name must be full-width katakana characters")
      end

      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できないこと' do
        @user.kana_first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name must be full-width katakana characters")
      end
    end
  end
end
