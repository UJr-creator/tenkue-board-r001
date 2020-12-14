FactoryBot.define do
  factory :user do
    name { "test" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "12345test" }
    password_confirmation { password }
  end
end
