require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do  
    expect(@user).to be_valid
  end

  it "passwordが6文字以上かつ英数字1つずつ入れることで登録できる。" do
    
    @user.password = "000000a"
    @user.password_confirmation = "000000a"
    expect(@user).to be_valid
  end

  it "nicknameが空では登録できないこと" do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it "emailが空では登録できないこと" do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it "emailに@を含まないと登録できないこと" do
    @user.email = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end

  it "emailが重複したら登録できないこと" do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end

  it "passwordが空では登録できないこと" do
    @user.password = ''
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it "passwordが6文字以下では登録できないこと" do
    @user.password = '123as'
    @user.password_confirmation = '123as'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  it "passwordに数字が最低1つはないと登録できないこと" do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it "passwordにローマ字が最低1つはないと登録できないこと" do
    @user.password = '000000'
    @user.password_confirmation = '000000'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it "passwordと確認用パスワードは同一出ないと登録できないこと" do
    @user.password = '12345a'
    @user.password_confirmation = '123456a'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "first_nameが空では登録できないこと" do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it "first_nameが日本語でなければ登録できないこと" do
    @user.first_name = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid")
  end

  it "last_nameが空では登録できないこと" do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it "last_nameが日本語でなければ登録できないこと" do
    @user.last_name = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name is invalid")
  end

  it "kana_first_nameが空では登録できないこと" do
    @user.kana_first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana first name can't be blank")
  end

  it "kana_first_nameがカタカナでなければ登録できないこと" do
    @user.kana_first_name = 'あああ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana first name is invalid")
  end

  it "kana_last_nameが空では登録できないこと" do
    @user.kana_last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana last name can't be blank")
  end

  it "kana_last_nameがカタカナでなければ登録できないこと" do
    @user.kana_first_name = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana first name is invalid")
  end

  it "birthdayが空では登録できないこと" do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end
