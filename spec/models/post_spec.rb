require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is not null" do
    post = Post.new(content: nil)
    post.valid?
    expect(post.errors[:content]).to include("を入力してください")
  end

  it "投稿内容は140文字以内" do
    post = Post.new(content: "a" * 141)
    post.valid?
    expect(post.errors[:content]).to include("は140文字以内で入力してください")
  end
end
