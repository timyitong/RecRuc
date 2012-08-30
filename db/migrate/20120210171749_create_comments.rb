class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :parent
      t.integer :kid
      t.string :content

      t.timestamps
    end
  end
end
