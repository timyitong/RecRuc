class CreateActivityUserActions < ActiveRecord::Migration
  def change
    create_table :activity_user_actions do |t|
      t.integer :user_id
      t.string :type
      t.string :note

      t.timestamps
    end
  end
end
