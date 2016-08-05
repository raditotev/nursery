class AddGeneratedPasswordToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :generated_password, :string
  end
end
