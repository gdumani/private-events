class AddIndexToAttendedEvents < ActiveRecord::Migration[6.1]
  def change
    add_index :attended_events, :event_user_id
    add_index :attended_events, :user_event_id
  end
end
