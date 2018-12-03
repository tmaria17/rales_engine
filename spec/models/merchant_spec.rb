require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :items}
    it {should have_many :invoices}
    it {should have_many(:customers).through(:invoices) }
  end
  it 'should return top merchants by revenue' do
    customer_id = create(:customer).id
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id )
    item2 = create(:item, merchant_id: merchant1.id )
    item3 = create(:item, merchant_id: merchant2.id )
    item4 = create(:item, merchant_id: merchant1.id )

    invoice1 = create(:invoice, merchant_id: merchant1.id , customer_id: customer_id)
    invoice2 = create(:invoice, merchant_id: merchant1.id , customer_id: customer_id)
    invoice3 = create(:invoice, merchant_id: merchant2.id , customer_id: customer_id)
    invoice4 = create(:invoice, merchant_id: merchant1.id , customer_id: customer_id)

    invoice_item2 = create(:invoice_item, invoice_id: invoice2.id, item_id: item2.id)
    invoice_item2 = create(:invoice_item, invoice_id: invoice3.id, item_id: item3.id)
    invoice_item2 = create(:invoice_item, invoice_id: invoice4.id, item_id: item4.id)
    invoice_item2 = create(:invoice_item, invoice_id: invoice1.id, item_id: item2.id)


    transaction1 = create(:transaction, invoice_id: invoice1.id)
    transaction2 = create(:transaction, invoice_id: invoice2.id)
    transaction3 = create(:transaction, invoice_id: invoice3.id)
    transaction4 = create(:transaction, invoice_id: invoice4.id)
    expect(Merchant.most_revenue(1)).to eq ([merchant1])
  end
end
