class Character < ApplicationRecord
  has_one_attached :avatar

  belongs_to :user

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :experience, numericality: { greater_than_or_equal_to: 0 }
  validates :money, numericality: { greater_than_or_equal_to: 0 }
  validates :level, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }
  validates :energy, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }
  validates :strength, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }
  validates :agility, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }
  validates :intelligence, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }
end
