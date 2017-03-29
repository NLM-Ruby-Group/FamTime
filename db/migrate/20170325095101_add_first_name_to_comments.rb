class AddFirstNameToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :first_name, :text
  end
end
