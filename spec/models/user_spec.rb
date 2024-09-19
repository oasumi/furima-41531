require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"←テストを保留するためのテンプレ
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do

    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
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
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'last_nameが全角日本語でないと保存できないこと' do
        @user.last_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end

      it 'first_nameが全角日本語でないと保存できないこと' do
        @user.first_name = 'suzuki'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

    end
  end
end  
