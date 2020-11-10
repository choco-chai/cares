class Comment < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

  validates :text, presence: true
end
