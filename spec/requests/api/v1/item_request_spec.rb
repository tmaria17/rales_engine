require 'rails_helper'

describe "Items API" do
  it 'sends a list of items' do
    create_list(:item, 3)

    get '/api/v1/items.json'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(3)

  end

  it 'can get one merchant by id' do

    id = create(:item).id

    get "/api/v1/items/#{id}.json"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item["data"]["id"]).to eq(id.to_s)
  end
end
