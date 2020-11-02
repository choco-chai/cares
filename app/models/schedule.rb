class Schedule < ApplicationRecord
  belongs_to :care_user
  has_many :comments
end
