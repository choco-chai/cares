class Schedule < ApplicationRecord
  with_options presence: true do
    validates :times, format: { with: /\A([01][0-9]|2[0-3]):[0-5][0-9]\Z/ , message: 'の入力には:を使用してください。1~9時の場合は先頭に0を入れてください(例 09:30,13:00)'}
    validates :title, length: { maximum: 10 }
    validates :text
  end

  belongs_to :care_user
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
end
