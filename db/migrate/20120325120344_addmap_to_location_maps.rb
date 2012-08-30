class AddmapToLocationMaps < ActiveRecord::Migration
  def up
      change_table :location_maps do |t|
      t.has_attached_file :map
    end
    remove_column :location_maps, :mapurl
  end

  def down
    
  end
end
