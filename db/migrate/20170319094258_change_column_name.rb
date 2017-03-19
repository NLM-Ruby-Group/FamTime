class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :account, :first_name
    rename_column :users, :full_name, :last_name
  end
end
