class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  validates :content, presence: true, length: {maximum:140}
  validates :user_id,presence:true

  def already_liked?(user)
    self.likes.exists?(user_id: user.id)
  end

  def user
    return User.find_by(id: self.user_id)
  end
  
  has_many :comments, dependent: :destroy
end