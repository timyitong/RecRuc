class RenameColummnsTweets < ActiveRecord::Migration
  def up
    rename_column :tweets, :comments, :commentsnum
    rename_column :tweets, :retweets, :retweetsnum
  end

  def down
  end
end
