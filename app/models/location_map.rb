class LocationMap < ActiveRecord::Base
  has_many :location_map_points
  has_attached_file :map, :styles => { :normal => "800x400>" ,:original=>"2400x2400>"}
  belongs_to :location
end
