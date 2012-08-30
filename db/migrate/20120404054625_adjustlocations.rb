class Adjustlocations < ActiveRecord::Migration
  def up
  	#remove_column :locations, :parent_id
  	add_column :locations, :wiki, :text 
  end

  def down
  end
end
