class MofifyFieldPhotoTableUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :photo, :text 
  end
end
