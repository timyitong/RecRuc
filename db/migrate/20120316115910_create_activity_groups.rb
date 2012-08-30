class CreateActivityGroups < ActiveRecord::Migration
  def change
    create_table :activity_columns do |t|
      t.integer :activity_id
      t.string :name
      t.timestamps
    end
  end
end
