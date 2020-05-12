class Group < ApplicationRecord
  has_many :group_users
  belongs_to :user
  has_many :chats
  
  accepts_nested_attributes_for :group_users
end
