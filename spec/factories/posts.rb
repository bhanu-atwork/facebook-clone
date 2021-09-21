FactoryBot.define do
  factory :post do
    user
    body { Faker::Alphanumeric.alpha}
  end
end