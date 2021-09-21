FactoryBot.define do
  factory :comment do
    user
    post
    body { Faker::Alphanumeric.alpha(number: 10)}
  end
end