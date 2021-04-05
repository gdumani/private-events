class AddIndexToEvents < ActiveRecord::Migration[6.1]
  def change
     add_index :events, :event_date
  end
end
