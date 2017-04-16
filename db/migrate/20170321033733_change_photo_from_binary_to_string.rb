class ChangePhotoFromBinaryToString < ActiveRecord::Migration[5.0]
  def change
    change_column :places, :photo, :string
  end
end
