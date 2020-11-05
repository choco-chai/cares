class Comment < ApplicationRecord
  belongs_to :schedule, dependent: :destroy
  belongs_to :user
end
