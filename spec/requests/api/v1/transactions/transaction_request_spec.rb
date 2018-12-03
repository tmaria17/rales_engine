require 'rails_helper'

describe "Transactions API" do
  it 'sends a list of transactions' do
    create_list(:transaction, 3)

    get '/api/v1/transactions.json'

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions["data"].count).to eq(3)

  end

  it 'can get one transaction by id' do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}.json"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["data"]["id"]).to eq(id.to_s)
  end
end
