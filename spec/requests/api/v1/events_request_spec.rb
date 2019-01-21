require 'rails_helper'

describe "Events API" do
  it "sends a list of events" do
    create_list(:event, 3)

    get "/api/v1/events"
    puts response.body
    expect(response).to be_successful

    events = JSON.parse(response.body)
  end

  it "can get one event by its id" do
    id = create(:event).id
    get "/api/v1/events/#{id}"

    event = JSON.parse(response.body)

    expect(response).to be_successful
    expect(event["id"]).to eq(id)    
  end
end  