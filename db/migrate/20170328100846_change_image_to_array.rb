class ChangeImageToArray < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :image, :text
    change_column :places, :image, :text
  end
end
