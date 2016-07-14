class ChangeUserToUsernameInAdmin < ActiveRecord::Migration[5.0]
  def change
    rename_column :admins, :name, :username
  end
end
