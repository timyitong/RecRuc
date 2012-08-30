class Addicontolocation < ActiveRecord::Migration
   def up
      change_table :locations do |t|
      t.has_attached_file :location_icon
    end
  end

  def down
  end
end
