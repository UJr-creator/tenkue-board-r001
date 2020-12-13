require 'rails_helper'

RSpec.describe User, type: :model do
  it "メールアドレスには全角文字が含まれていない" do
    user = User.new(email: "あ123@example.com")
    user.valid?
    expect(user.errors[:email]).to include("は不正な値です")
  end

  it "パスワードは8文字以上" do
    user = User.new(password: "123abc")
    user.valid?
    expect(user.errors[:password]).to include("は不正な値です")
  end

  it "パスワードは32文字以下" do
    user = User.new(password: "a1b2c3d4e5f6g7h8i9j1k2l3m4n5o6p7q8")
    user.valid?
    expect(user.errors[:password]).to include("は不正な値です")
  end

  it "パスワードは半角英数字いずれも含まれている" do
    user = User.new(password: "123456789")
    user.valid?
    expect(user.errors[:password]).to include("は不正な値です")
  end
end
