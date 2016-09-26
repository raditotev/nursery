class ChangeBreakToEvent < ActiveRecord::Migration[5.0]
  def change
    rename_table :breaks, :events
  end
end
