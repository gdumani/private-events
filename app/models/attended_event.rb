class AttendedEvent < ApplicationRecord 
    belongs_to :user_event 
    belongs_to :event_user
end
