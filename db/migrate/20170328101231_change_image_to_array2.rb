class ChangeImageToArray2 < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :image, :text, array: true, default: [], using: "(string_to_array(image, ','))"
    change_column :places, :image, :text, array: true, default: [], using: "(string_to_array(image, ','))"

  end
end
