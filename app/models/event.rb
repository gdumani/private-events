class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id 
  has_many :attended_events, foreign_key: :user_event_id
  has_many :attendees, through: :attended_events, foreign_key: :event_user_id, class_name: 'User', source: :user
end
