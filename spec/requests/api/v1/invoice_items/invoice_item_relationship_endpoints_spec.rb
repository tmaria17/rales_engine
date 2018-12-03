require 'rails_helper'

describe 'Invoice Items relationships' do
  it 'returns the invoice for an invoice item'do
    merchant_id  = create(:merchant).id
    customer_id  = create(:customer).id
    invoice = create(:invoice, merchant_id: merchant_id, customer_id: customer_id)

    item = create(:item, merchant_id: merchant_id)

    invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices["data"]["id"]).to eq(invoice.id.to_s)
  end
  it 'returns the item for an invoice item'do
    merchant_id  = create(:merchant).id
    customer_id  = create(:customer).id
    invoice = create(:invoice, merchant_id: merchant_id, customer_id: customer_id)
    item = create(:item, merchant_id: merchant_id)
    invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["data"]["id"]).to eq(item.id.to_s)
  end
end
