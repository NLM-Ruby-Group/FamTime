class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :account
      t.string :email
      t.string :full_name
      t.text :address
      t.string :password_digest
      t.binary :photo
      t.string :tel

      t.timestamps
    end
  end
end
