class AddPhoneNumberToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_number_id, :integer
  end
end
