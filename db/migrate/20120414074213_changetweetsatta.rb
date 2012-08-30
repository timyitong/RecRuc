class Changetweetsatta < ActiveRecord::Migration
  def up
   drop_attached_file :tweets, :photo
   drop_attached_file :activities, :photo
   change_table :tweets do |t|
	t.has_attached_file :t_photo
   end
   change_table :activities do |t|
   	t.has_attached_file :photo
   end
  end

  def down
  end
end
