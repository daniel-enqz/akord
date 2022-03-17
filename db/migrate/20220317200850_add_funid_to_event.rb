class AddFunidToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :funid, :string, null: false, default: "random()"
    add_index :events, :funid, unique: true
  end
end
