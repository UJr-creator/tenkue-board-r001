class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment, format: { with: /\A[[:^cntrl:]]{1,10}$+/ }
end