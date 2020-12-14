require 'rails_helper'

RSpec.describe User, type: :model do
  it "全ての値が正しいと登録可能" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  
  it "メールアドレスには全角文字が含まれていない" do
    user = User.new(email: "あ123@example.com")
    user.valid?
    expect(user.errors[:email]).to include("は不正な値です")
  end

  it "パスワードは8文字以下でエラーが発生" do
    user = User.new(password: "123abc")
    user.valid?
    expect(user.errors[:password]).to include("は不正な値です")
  end

  it "パスワードは32文字以上でエラーが発生" do
    user = User.new(password: "a1b2c3d4e5f6g7h8i9j1k2l3m4n5o6p7q8")
    user.valid?
    expect(user.errors[:password]).to include("は不正な値です")
  end

  it "パスワードは半角数字のみではエラーが発生" do
    user = User.new(password: "123456789")
    user.valid?
    expect(user.errors[:password]).to include("は不正な値です")
  end

  it "パスワードは半角英字のみではエラーが発生" do
    user = User.new(password: "abcdefg")
    user.valid?
    expect(user.errors[:password]).to include("は不正な値です")
  end

end
