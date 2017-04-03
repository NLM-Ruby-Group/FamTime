class AddUserIdToPhoneNumber < ActiveRecord::Migration[5.0]
  def change
    add_column :phone_numbers, :user_id, :integer
  end
end
