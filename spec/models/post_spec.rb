require 'rails_helper'

RSpec.describe Post, type: :model do
  it "投稿が空白の時、投稿できない" do
    post = Post.new(content: nil)
    post.valid?
    expect(post.errors[:content]).to include("は不正な値です")
  end

  it "投稿内容は140文字以上の時、投稿できない" do
    post = Post.new(content: "a" * 141)
    post.valid?
    expect(post.errors[:content]).to include("は不正な値です")
  end

  it "投稿内容は140文字以内で、投稿可能" do 
    post = FactoryBot.build(:post)
    expect(post).to be_valid
  end

end