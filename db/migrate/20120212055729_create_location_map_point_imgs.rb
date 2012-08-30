class CreateLocationMapPointImgs < ActiveRecord::Migration
  def change
    create_table :location_map_point_imgs do |t|
      t.integer :point_id
      t.string :imgurl

      t.timestamps
    end
  end
end
