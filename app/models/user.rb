class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true , length: { in: 1..15 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { in: 8..32 }, format: { with: VALID_PASSWORD_REGEX }, allow_nil: true
  validates :profile, length: { maximum: 255 }
  
  has_secure_password
  
  has_many :topics
  has_many :comments
  has_many :chats
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
  
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def following?(other_user)
    following.include?(other_user)
  end
  
  has_many :group_users
  has_many :groups
  
  has_many :active_notifications, foreign_key: "visitor_id", class_name: "Notification", dependent: :destroy
  has_many :passive_notifications, foreign_key: "visited_id", class_name: "Notification", dependent: :destroy

end
