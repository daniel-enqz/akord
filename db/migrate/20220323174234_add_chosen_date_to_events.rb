class AddChosenDateToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :chosen_date, :date
  end
end
