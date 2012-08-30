class CreateLocationHaveLocations < ActiveRecord::Migration
  def change
    create_table :location_have_locations do |t|
      t.integer :location_id
      t.integer :child_id

      t.timestamps
    end
  end
end
