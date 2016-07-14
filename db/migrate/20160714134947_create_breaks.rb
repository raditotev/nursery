class CreateBreaks < ActiveRecord::Migration[5.0]
  def change
    create_table :breaks do |t|
      t.date :start_date
      t.date :end_date
      t.text :description

      t.timestamps
    end
  end
end
