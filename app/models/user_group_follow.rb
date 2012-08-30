class UserGroupFollow < ActiveRecord::Base
  belongs_to :user_group
  has_one :user, :through=>:user_group
end
