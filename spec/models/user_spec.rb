require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
   context '新規登録できるとき' do
    it "全ての項目がが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
      @user.password = "aaa000"
      @user.password_confirmation = "aaa000"
      expect(@user).to be_valid
    end
   end
  end
  context '新規登録できないとき' do
    it "nicknameが空では登録できない" do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが6文字以下では登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid? 
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end 
    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid? 
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end 
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid? 
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid? 
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_nameは全角入力でなければ登録できない" do
      @user.first_name = "ﾀﾛｳ"
      @user.valid? 
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "last_nameは全角入力でなければ登録できない" do
      @user.last_name = "ﾀﾛｳ"
      @user.valid? 
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "first_name_kanaは全角入力でなければ登録できない" do
      @user.first_name_kana = "ﾀﾛｳ"
      @user.valid? 
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "last_name_kanaは全角入力でなければ登録できない" do
      @user.last_name_kana = "ﾀﾛｳ"
      @user.valid? 
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "birth_dayがなければ登録できない" do
      @user.birth_day = ""
      @user.valid? 
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end 
    it "passwordは半角数字のみでは登録できない" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
    end 
    it "passwordは英語のみでは登録できない" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
    end
    it "passwordは全角では登録できない" do
      @user.password = "ZZZZZZ"
      @user.password_confirmation = "ZZZZZZ"
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
    end
    it "emaiは＠が含まれていないと登録できない" do
      @user.email = "hogehoge"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "firsy_nameは漢字、平仮名、カタカナ以外では登録できない" do
      @user.first_name = "kaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "last_nameは漢字、平仮名、カタカナ以外では登録できない" do
      @user.last_name = "kaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "passwordとpassword_confirmationが不一致の場合は登録できない" do
      @user.password = "aaa000"
      @user.password_confirmation = "aaa111"
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
