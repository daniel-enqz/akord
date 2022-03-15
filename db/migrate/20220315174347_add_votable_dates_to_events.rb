class AddVotableDatesToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :votable_dates_strings, :jsonb, null: false, default: []
  end
end
