class Review < ApplicationRecord
  belongs_to :list
  validates :rating, inclusion: { in: (0..5).to_a }
  validates :comment, :rating, presence: true
end
