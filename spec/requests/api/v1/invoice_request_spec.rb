require 'rails_helper'

describe "Invoices API" do
  it 'sends a list of invoices' do
    create_list(:invoice, 3)

    get '/api/v1/invoices.json'

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices["data"].count).to eq(3)

  end

  it 'can get one invoice by id' do

    id = create(:invoice).id

    get "/api/v1/invoices/#{id}.json"

    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice["data"]["id"]).to eq(id.to_s)
  end
end
