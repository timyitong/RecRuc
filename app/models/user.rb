#encoding: utf-8
class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :password, :on => :check,:message=>'不能为空'
  validates_presence_of :password, :on => :create,:message=>'不能为空'

  has_many :user_groups
  has_many :user_group_follows, :through=>:user_groups
  has_many :tweets, :order => "created_at DESC"
  has_attached_file :avatar, :styles => { :medium => "100x100", :thumb => "64x64",:mini =>'30X30' }
  
  has_many :activity_user_actions
  has_many :user_follow_locations
  has_many :user_follow_tags
  has_many :user_follow_users
  has_many :users, :through=>:user_follow_users, :foreign_key=>'follow_id'
  has_many :activities
  has_many :comments
end


