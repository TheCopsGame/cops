class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable

  validates :username, presence: true
end
