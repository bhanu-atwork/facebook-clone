FactoryBot.define do
  factory :friend do
    association :first_user_id, factory: :user
    association :second_user_id, factory: :user
  end
end