class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.date :date
      t.integer :rate, default: 0, null: false
      t.references :event, null: false, foreign_key: true
      t.uuid :attendee_id, null: false

      t.timestamps
    end

    add_index :votes, :attendee_id
  end
end
