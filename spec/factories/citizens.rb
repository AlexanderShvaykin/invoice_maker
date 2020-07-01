FactoryBot.define do
  factory :citizen do
    user { nil }
    name { "MyString" }
    last_name { "MyString" }
    middle_name { "MyString" }
    inn { "MyString" }
    address { "MyString" }
    phone { "MyString" }

    trait :bank do
      after(:create) do |citizen|
        create :bank, citizen: citizen
      end
    end
  end
end
