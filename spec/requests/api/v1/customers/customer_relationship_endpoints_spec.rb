require 'rails_helper'
describe 'customer relationships' do
   it 'returns customers invoices' do
     customer = create(:customer)
     merchant = create(:merchant)
     create_list(:invoice, 20, merchant_id: merchant.id, customer_id: customer.id)

     get "/api/v1/customers/#{customer.id}/invoices"

     expect(response).to be_successful

     invoices = JSON.parse(response.body)

     expect(invoices["data"].count).to eq(20)
  end
  it 'returns customers transactions' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 15 , invoice_id: invoice.id)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions["data"].count).to eq(15)
  end
end
