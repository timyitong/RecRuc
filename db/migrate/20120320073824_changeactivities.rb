class Changeactivities < ActiveRecord::Migration
  def up
    add_column :activities, :starttime, :datetime
    add_column :activities, :endtime, :datetime
    add_column :activities, :location_id, :integer
  end

  def down
    
  end
end
