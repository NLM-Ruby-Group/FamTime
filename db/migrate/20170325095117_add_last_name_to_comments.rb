class AddLastNameToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :last_name, :text
  end
end
