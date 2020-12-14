class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes
  has_many :comments

  validates :email, format: { with: /[-~｡-ﾟ]/ }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}$+\z/i }

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: 'ゲストユーザ') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
