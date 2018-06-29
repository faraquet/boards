class UserBoard < ApplicationRecord
  scope :uncompleted, -> { where(completed_at: nil) }

  has_many :answers
end
