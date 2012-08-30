class CorActUserAct < ActiveRecord::Migration
  def up
    rename_column :activity_user_actions, :type, :action_type
  end

  def down
  end
end
