FactoryBot.define do
  factory :invoice do
    status { "MyString" }
    merchant {  create(:merchant) }
    customer {  create(:customer) }
  end
end
