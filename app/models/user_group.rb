class UserGroup < ActiveRecord::Base
  has_many :user_group_follows
  belongs_to :user
end
