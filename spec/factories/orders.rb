FactoryBot.define do
  factory :invoice do
    user { nil }
    organization { nil }
    number { "MyString" }
  end
end
