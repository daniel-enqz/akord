class RemoveNullFalseFromAttendeeId < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :attendee_id, :uuid, null: true
  end

  def down
    change_column :users, :attendee_id, :uuid, null: false
  end
end
