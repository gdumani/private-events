class AttendedEvent < ApplicationRecord 
    belongs_to :user_event, class_name: "Event"
    belongs_to :event_user, class_name: "User"
end
