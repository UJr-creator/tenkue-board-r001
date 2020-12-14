require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "コメントが空白の時、コメントできない" do
    comment = Comment.new(comment: nil)
    comment.valid?
    expect(comment.errors[:comment]).to include("は不正な値です")
  end

  it "コメントは140文字以上の時、コメントできない" do
    comment = Comment.new(comment: "a" * 141)
    comment.valid?
    expect(comment.errors[:comment]).to include("は不正な値です")
  end

  it "コメントは140文字以内で、投稿可能" do
    @comment = FactoryBot.build(:comment)
    expect(@comment).to be_valid
  end
end
