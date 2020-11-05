class Schedule < ApplicationRecord
  with_options presence: true do
    validates :times, format: { with: /\A([01][0-9]|2[0-3]):[0-5][0-9]\Z/ , message: 'の入力には:を使用してください(例 13:30)'}
    validates :title, :text
  end

  belongs_to :care_user
  belongs_to :user
  has_many :comments
  has_many_attached :images
end
