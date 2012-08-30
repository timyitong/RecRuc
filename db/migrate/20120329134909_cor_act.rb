class CorAct < ActiveRecord::Migration
  def up
  	add_column :activities, :user_id, :integer
  end

  def down
  end
end
