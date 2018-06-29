class UserBoard < ApplicationRecord
  has_many :answers
  has_many :admins, through: :answers
end
