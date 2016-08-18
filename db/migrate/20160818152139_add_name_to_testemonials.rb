class AddNameToTestemonials < ActiveRecord::Migration[5.0]
  def change
    add_column :testemonials, :name, :string
  end
end
