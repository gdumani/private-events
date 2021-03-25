class User < ApplicationRecord
  has_many :events

  validates :username, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "invalid email address"}

end
