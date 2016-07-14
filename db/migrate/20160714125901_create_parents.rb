class CreateParents < ActiveRecord::Migration[5.0]
  def change
    create_table :parents do |t|
      t.string :title
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
