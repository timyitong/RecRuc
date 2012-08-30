class RenameColumnLocationmaps < ActiveRecord::Migration
  def up
    rename_column :location_maps, :valid, :inuse
  end

  def down
  end
end
