require 'rails_helper'

describe 'Item relationships' do
  it 'returns all invoice items for an invoice'do
    merchant_id  = create(:merchant).id
    customer_id  = create(:customer).id
    invoice  = create(:invoice, merchant_id: merchant_id, customer_id: customer_id)
    item = create(:item, merchant_id: merchant_id)
    invoice_item1 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
    invoice_item1 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_successful

    ii = JSON.parse(response.body)

    expect(ii["data"].count).to eq(2)
  end

  it 'returns the merchant for the item' do
   merchant_id  = create(:merchant).id
   item = create(:item, merchant_id: merchant_id)

   get "/api/v1/items/#{item.id}/merchant"

   expect(response).to be_successful

   merchant = JSON.parse(response.body)

   expect(merchant["data"]["id"]).to eq(merchant_id.to_s)

 end
end
