class Altercomments < ActiveRecord::Migration
  def up
    drop_table :comments
    create_table :comments do |t|
      t.string :commenter
      t.integer :commenter_id
      t.text :content
      t.references :tweet
 
      t.timestamps
    end
    add_index :comments, :tweet_id    
  end
  def down
  end
end
