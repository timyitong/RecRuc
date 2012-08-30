class Addphotototweets < ActiveRecord::Migration
  def up
    change_table :tweets do |t|
      t.has_attached_file :photo
    end
    remove_column :tweets, :imgurl
  end

  def down
    drop_attached_file :tweets, :photo
  end
end
