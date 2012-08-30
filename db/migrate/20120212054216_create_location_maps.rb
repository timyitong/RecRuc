class CreateLocationMaps < ActiveRecord::Migration
  def change
    create_table :location_maps do |t|
      t.integer :location_id
      t.string :mapurl
      t.string :valid

      t.timestamps
    end
  end
end
