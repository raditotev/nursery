class RemoveUrlFromNewsletters < ActiveRecord::Migration[5.0]
  def change
    remove_column :newsletters, :url
  end
end
