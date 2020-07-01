FactoryBot.define do
  factory :invoices_item, class: 'Invoices::Item' do
    invoice { nil }
    name { "MyString" }
    count { 1 }
    price { 1 }
  end
end
