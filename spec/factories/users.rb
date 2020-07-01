FactoryBot.define do
  sequence :email do |n|
    "email#{n}@test.test"
  end

  factory :user do
    email
    password { "secret" }

    trait :citizen do
      after(:create) do |user|
        create :citizen, :bank, user: user
      end
    end
  end
end
