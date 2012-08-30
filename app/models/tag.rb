class Tag < ActiveRecord::Base
  has_many :activity_tags
  has_many :activities, :through=>:activity_tags
  has_attached_file :icon, :styles => { :normal => "64x64>"}
end
