class Activity < ActiveRecord::Base
  has_many :activity_tags
  has_many :tags, :through=>:activity_tags
  has_many :activity_comments
  has_many :activity_livereports
  has_many :activity_user_actions
  
  has_attached_file :photo, :styles => { :large => "500>", :small => "185x150" }
  belongs_to :user
  belongs_to :location

  has_many :activity_refs
  has_many :tweets
  
end
