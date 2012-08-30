class CreateUserFollowTags < ActiveRecord::Migration
  def change
    create_table :user_follow_tags do |t|
      t.integer :user_id
      t.integer :follow_id

      t.timestamps
    end
  end
end
