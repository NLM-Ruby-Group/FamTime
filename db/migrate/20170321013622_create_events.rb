class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name
      t.integer :min_participants
      t.integer :max_participants
      t.integer :price
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :is_published
      t.binary :photo

      t.timestamps
    end
  end
end
