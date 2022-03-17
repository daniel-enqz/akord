class AddFunidToEvent < ActiveRecord::Migration[6.1]
  def up
    add_column :events, :funid, :string
    change_column :events, :funid, :string, null: false, using: "CONCAT(REGEXP_REPLACE(LOWER(title), ' ', '-', 'g'), RANDOM())"
    add_index :events, :funid, unique: true
  end

  def down
    remove_index :events, :funid, unique: true
    remove_column :events, :funid, :string
  end
end
