require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "コメントはnot null" do
    comment = Comment.new(comment: nil)
    comment.valid?
    expect(comment.errors[:comment]).to include("は不正な値です")
  end

  it "コメントは140文字以内" do
    comment = Comment.new(comment: "a" * 141)
    comment.valid?
    expect(comment.errors[:comment]).to include("は不正な値です")
  end
end
