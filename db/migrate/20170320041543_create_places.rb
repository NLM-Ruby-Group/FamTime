class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.binary :photo
      t.time :opening_hours
      t.float :rating

      t.timestamps
    end
  end
end
