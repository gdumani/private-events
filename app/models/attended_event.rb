class AttendedEvent < ApplicationRecord 
    belongs_to :event, foreign_key: :user_event_id
    belongs_to :user, foreign_key: :event_user_id 
    validates_uniqueness_of :event_user_id, scope: :user_event_id

end
