class ChangePhotoInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :photo, :string
    rename_column :events, :photo, :image
  end
end
