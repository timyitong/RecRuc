class AddcolumntouserCurlocations < ActiveRecord::Migration
  def up
    add_column :user_curlocations, :inuse, :integer
  end

  def down
    drop_column :user_curlocations, :inuse
  end
end
