FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyString" }
    unit_price { "MyString" }
    merchant { create(:merchant)}
  end
end
