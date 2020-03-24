class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :number, presence: true
  validates :description, presence: true
  
  belongs_to :user
end
