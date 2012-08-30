class Changecomments < ActiveRecord::Migration
  def up
  	rename_column :comments, :commenter_id, :user_id
  	remove_column :comments, :commenter
  end

  def down
  end
end
