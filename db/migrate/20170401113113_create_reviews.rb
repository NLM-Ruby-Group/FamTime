class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.text :body
      t.integer :rating
      t.text :first_name
      t.text :last_name

      t.timestamps
    end
  end
end
