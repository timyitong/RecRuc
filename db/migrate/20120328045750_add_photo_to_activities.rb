class AddPhotoToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.has_attached_file :photo
    end
  end
end
