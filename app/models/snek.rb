class Snek < ApplicationRecord

  belongs_to :user

  validates :user, presence: true

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :sex, inclusion: { in: %w(Male Female) }, allow_blank: true

end
