class CreateUserCurlocations < ActiveRecord::Migration
  def change
    create_table :user_curlocations do |t|
      t.integer :user_id
      t.integer :location_id
      t.time :open_time

      t.timestamps
    end
  end
end
