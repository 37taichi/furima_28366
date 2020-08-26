require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do  
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailは＠がないと登録できない" do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは英数混合でないと保存できない" do
      @user.password = "000000"
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password cannot be saved unless it is mixed alphanumeric")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名前が空だと保存できないこと' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '名前が全角日本語でないと保存できないこと' do
      @user.first_name = "akira"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    it '苗字が空だと保存できないこと' do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it '苗字が全角日本語でないと保存できないこと' do
      @user.family_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
    end
    it '振り仮名が空だと保存できないこと' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it '振り仮名が全角カナでないと保存できないこと' do
      @user.first_name_kana = "ｱｷﾗ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width kana characters.")
    end
    it '振り仮名が空だと保存できないこと' do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it '振り仮名が全角カナでないと保存できないこと' do
      @user.family_name_kana = "ｽｽﾞｷ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width kana characters.")
    end
    it '生年月日が空だと保存できないこと' do
      @user.birthday = " "
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
