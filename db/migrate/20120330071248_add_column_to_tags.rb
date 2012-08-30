class AddColumnToTags < ActiveRecord::Migration
  def change
  	add_column :tags, :refnum, :integer
  end
end
