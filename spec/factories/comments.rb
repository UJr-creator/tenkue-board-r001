FactoryBot.define do
  factory :comment do
    comment {"abcde"}
    association :user
    association :post
  end
end
