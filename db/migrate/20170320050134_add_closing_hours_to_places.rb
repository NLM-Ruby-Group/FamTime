class AddClosingHoursToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :closing_hours, :time
  end
end
