class CreateActivityRefs < ActiveRecord::Migration
  def change
    create_table :activity_refs do |t|
      t.integer :activity_id
      t.string :ref_name
      t.integer :refnum

      t.timestamps
    end
  end
end
