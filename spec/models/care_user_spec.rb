require 'rails_helper'

RSpec.describe CareUser, type: :model do
  describe CareUser do
    before do
      @care_user = FactoryBot.build(:care_user)
    end

    describe '利用者新規登録' do
      context '新規登録がうまくいくとき' do
        it '全ての値が正しく入力されていれば登録できる' do
          expect(@care_user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nameが空だと登録できない' do
          @care_user.name = ''
          @care_user.valid?
          expect(@care_user.errors.full_messages).to include("利用者名を入力してください")
        end
      end
    end
  end
end
