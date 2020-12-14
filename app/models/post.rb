class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
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
