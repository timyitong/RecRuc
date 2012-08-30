class AddColumnIntoLocations < ActiveRecord::Migration
  def up
  	add_column :locations,:nametree,:string
  end

  def down
  end
end
