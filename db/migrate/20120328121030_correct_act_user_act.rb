class CorrectActUserAct < ActiveRecord::Migration
  def up
    add_column :activity_user_actions, :activity_id, :integer
  end

  def down
  end
end
