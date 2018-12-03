require 'rails_helper'

describe 'Invoice Items relationships' do
  it 'returns the invoice for an invoice item'do
    merchant_id  = create(:merchant).id
    customer_id  = create(:customer).id
    invoice = create(:invoice, merchant_id: merchant_id, customer_id: customer_id)

    item = create(:item, merchant_id: merchant_id)

    invoice_item = InvoiceItem.create!(quantity:1, unit_price: 10, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices["data"]["id"]).to eq(invoice.id)
  end
