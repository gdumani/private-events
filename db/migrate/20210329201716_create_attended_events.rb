class CreateAttendedEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :attended_events do |t|
      t.integer :event_user_id
      t.integer :user_event_id

      t.timestamps
    end
  end
end
