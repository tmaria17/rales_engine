require 'rails_helper'

describe "Items API" do
  it 'sends a list of items' do
    # merchant = create(:merchant)
    create_list(:item, 3)

    get '/api/v1/items.json'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(3)

  end

  it 'can get one merchant by id' do

    id = create(:item).id

    get "/api/v1/items/#{id}.json"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["id"]).to eq(id)
  end
end
