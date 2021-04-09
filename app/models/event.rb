class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :attended_events, foreign_key: :user_event_id
  has_many :attendees, through: :attended_events, foreign_key: :event_user_id, class_name: 'User', source: :user
  scope :upcoming_events, -> { where('event_date >= ?', Time.now) }
  scope :previous_events, -> { where('event_date < ?', Time.now) }
  validates :description, presence: true
end
