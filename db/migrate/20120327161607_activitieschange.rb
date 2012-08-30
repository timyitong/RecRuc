class Activitieschange < ActiveRecord::Migration
  def up
    add_column :activities, :title, :string
    add_column :activities, :slogan, :text
    add_column :activities, :content, :text
    remove_column :activities, :tweet_id
  end

  def down
  end
end
