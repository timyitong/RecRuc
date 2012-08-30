class AddOolumnToTweets < ActiveRecord::Migration
  def change
  	add_column :tweets,:activity_id, :integer
  end
end
