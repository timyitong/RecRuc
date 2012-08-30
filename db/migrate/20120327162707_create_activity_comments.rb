class CreateActivityComments < ActiveRecord::Migration
  def change
    create_table :activity_comments do |t|
      t.integer :user_id
      t.integer :activity_id
      t.integer :to_user_id
      t.text :content

      t.timestamps
    end
  end
end
