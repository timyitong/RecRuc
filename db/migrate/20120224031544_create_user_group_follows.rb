class CreateUserGroupFollows < ActiveRecord::Migration
  def change
    create_table :user_group_follows do |t|
      t.integer :user_group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
