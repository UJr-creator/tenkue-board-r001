FactoryBot.define do
  factory :post do
    content {"aiueo"}
    association :user
  end
end