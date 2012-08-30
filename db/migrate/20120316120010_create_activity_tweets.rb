class CreateActivityTweets < ActiveRecord::Migration
  def change
    create_table :activity_tweets do |t|
      t.integer :activity_id
      t.integer :acticity_column_id
      t.integer :tweet_id
      t.timestamps
    end
  end
end
