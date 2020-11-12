require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe Schedule do
    before do
      @schedule = FactoryBot.build(:schedule)
    end

    describe 'ケア内容登録' do
      context '新規登録がうまくいくとき' do
        it '全ての値が正しく入力されていれば登録できる' do
          expect(@schedule).to be_valid
        end
        it '画像は選択されていなくても登録できる' do
          
        end
      end

      context 'ケア内容登録がうまくいかないとき' do
        it '開始時刻の入力がないと登録できない' do
          @schedule.times = nil
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("ケア開始時刻の入力には:を使用してください。1~9時の場合は先頭に0を入れてください(例 09:30,13:00)")
        end
        it '開始時刻に:が含まれていないと登録できない' do
          @schedule.times = "1130"
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("ケア開始時刻の入力には:を使用してください。1~9時の場合は先頭に0を入れてください(例 09:30,13:00)")
        end
        it '開始時刻に全角数字が含まれていると登録できない' do
          @schedule.times = "０９:００"
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("ケア開始時刻の入力には:を使用してください。1~9時の場合は先頭に0を入れてください(例 09:30,13:00)")
        end
        it '開始時刻が1~9時の場合、先頭の数字も2桁で入力しなければ登録できない' do
          @schedule.times = "9:00"
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("ケア開始時刻の入力には:を使用してください。1~9時の場合は先頭に0を入れてください(例 09:30,13:00)")
        end
        it 'タイトルの入力がないと登録できない' do
          @schedule.title = nil
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("タイトルを入力してください")
        end
        it 'タイトルは10文字以内でないと登録できない' do
          @schedule.title = "筋力トレーニングをしました"
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("タイトルは10文字以内で入力してください")
        end
        it '本文の入力がないと登録できない' do
          @schedule.text = nil
          @schedule.valid?
          expect(@schedule.errors.full_messages).to include("本文を入力してください")
        end
      end
    end
  end
end

