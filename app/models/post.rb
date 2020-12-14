class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  validates :content, format: { with: /\A[[:^cntrl:]]{1,10}$+/ }

  def already_liked?(user)
    self.likes.exists?(user_id: user.id)
  end

  def user
    return User.find_by(id: self.user_id)
  end

  has_many :comments, dependent: :destroy
end
