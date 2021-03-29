class User < ApplicationRecord
  has_many :events
  has_many :attended_events, foreign_key: :event_user_id
  has_many :attending_events, through: :attended_events, foreign_key: :user_event_id, class_name: 'Event', source: :event

  validates :username, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "invalid email address"}

end
