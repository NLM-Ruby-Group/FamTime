class RenamePhotoToImage < ActiveRecord::Migration[5.0]
  def change
    rename_column :places, :photo, :image
  end
end
