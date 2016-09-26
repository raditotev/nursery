class RemoveTitleFromTestemonials < ActiveRecord::Migration[5.0]
  def change
    remove_column :testemonials, :title
  end
end
