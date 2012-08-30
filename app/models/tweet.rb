class Tweet < ActiveRecord::Base
  attr_accessor :parent_id
  has_many :comments
  belongs_to :user
  belongs_to :location
  belongs_to :tweet, :foreign_key=>'retweet_id'
  has_attached_file :t_photo, :styles => { :large => "440>", :small => "120x120>" }
  
  belongs_to :activity
  def add_retweetsnum
   update_attribute(:retweetsnum, retweetsnum+1)
  end
  def add_commentsnum
   update_attribute(:commentsnum, commentsnum+1)
  end
end
