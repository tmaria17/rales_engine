require 'rails_helper'

describe "Invoice items API" do
  it 'sends a list of invoice_items' do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items.json'

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(invoice_items["data"].count).to eq(3)

  end

  it 'can get one invoice item by id' do

    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}.json"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"]["id"]).to eq(id.to_s)
  end
end
