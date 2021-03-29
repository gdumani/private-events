class User < ApplicationRecord
  has_many :events
  has_many :attended_events, foreign_key: :event_user_id
  has_many :events, through: :attended_events, class_name: 'Event' 

  validates :username, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "invalid email address"}

end
