class Schedule < ApplicationRecord
  belongs_to :care_user
  belongs_to :user
  has_many :comments
end
