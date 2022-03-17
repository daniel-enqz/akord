class AddFunidToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :funid, :string
  end
end
