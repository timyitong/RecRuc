class Location < ActiveRecord::Base
  has_many :tweets
  has_many :location_have_locations
  has_many :activities
  has_one :location_map
  has_attached_file :location_icon, :styles => { :normal => "64x64>"}
end
