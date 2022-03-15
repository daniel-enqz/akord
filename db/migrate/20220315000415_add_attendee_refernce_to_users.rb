class AddAttendeeRefernceToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :attendee_id, :uuid, null: false
    add_index :users, :attendee_id
  end
end
