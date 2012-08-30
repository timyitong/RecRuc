class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :content
      t.string :imgurl
      t.integer :retweets
      t.integer :comments

      t.timestamps
    end
  end
end
