class UserBoard < ApplicationRecord
  scope :uncompleted, -> { where(completed_at: nil) }
  validates :question, presence: true

  has_many :answers

  def name
    name = super
    name.presence || 'Anonymous'
  end
end
