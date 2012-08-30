class CreateLocationMapPoints < ActiveRecord::Migration
  def change
    create_table :location_map_points do |t|
      t.string :point_name
      t.integer :target_id
      t.integer :cox
      t.integer :coy
      t.integer :point_img_id
      t.references :location_map
      t.timestamps
    end
    add_index :location_map_points, :location_map_id 
  end
end
