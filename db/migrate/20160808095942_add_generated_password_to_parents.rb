class AddGeneratedPasswordToParents < ActiveRecord::Migration[5.0]
  def change
    add_column :parents, :generated_password, :string
  end
end
