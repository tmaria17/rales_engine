require 'rails_helper'

describe "Customers API" do
  it 'sends a list of customers' do
    create_list(:customer, 3)

    get '/api/v1/customers.json'

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers["data"].count).to eq(3)

  end

  it 'can get one merchant by id' do

    id = create(:customer).id

    get "/api/v1/customers/#{id}.json"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["data"]["id"]).to eq(id.to_s)
  end
end
