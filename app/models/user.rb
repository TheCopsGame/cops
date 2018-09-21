class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable

  has_one :character, dependent: :destroy

  validates :username, presence: true
end
