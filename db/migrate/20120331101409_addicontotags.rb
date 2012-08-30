class Addicontotags < ActiveRecord::Migration
  def up
      change_table :tags do |t|
      t.has_attached_file :icon
    end
  end

  def down
  end
end
