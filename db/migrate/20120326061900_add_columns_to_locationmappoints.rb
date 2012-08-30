class AddColumnsToLocationmappoints < ActiveRecord::Migration
  def change
    add_column :location_map_points, :width, :integer
    add_column :location_map_points, :height, :integer
  end
end
