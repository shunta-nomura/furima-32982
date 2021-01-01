require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '内容に問題がない場合' do
    it 'nameとemail、passwordとpassword_confirmation,日本語のfirst_name last_name,カタカナのkana_first_name,kana_last_nameが存在すれば登録できること' do
      expect(@user).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'emailに@を含まないと登録できないこと' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it 'emailが重複したら登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが6文字以下では登録できないこと' do
      @user.password = '123as'
      @user.password_confirmation = '123as'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it 'passwordに数字が最低1つはないと登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it 'passwordにローマ字が最低1つはないと登録できないこと' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it 'passwordは全角では登録できないこと' do
      @user.password = 'おはようございますaaa'
      @user.password_confirmation = 'おはようございますaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it 'passwordと確認用パスワードは同一出ないと登録できないこと' do
      @user.password = '12345a'
      @user.password_confirmation = '123456a'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください")
    end

    it 'first_nameが日本語でなければ登録できないこと' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("名字は不正な値です")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it 'last_nameが日本語でなければ登録できないこと' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は不正な値です")
    end

    it 'kana_first_nameが空では登録できないこと' do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(カナ)を入力してください")
    end

    it 'kana_first_nameがカタカナでなければ登録できないこと' do
      @user.kana_first_name = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(カナ)は不正な値です")
    end

    it 'kana_last_nameが空では登録できないこと' do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
    end

    it 'kana_last_nameがカタカナでなければ登録できないこと' do
      @user.kana_first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(カナ)は不正な値です")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end
