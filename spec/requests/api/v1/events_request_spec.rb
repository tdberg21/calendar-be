require 'rails_helper'

describe "Events API" do
  it "sends a list of events" do
    create_list(:event, 3)

    get "/api/v1/events"
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

  it "can create a new event" do
    event_params = { title: "Coding Meetup", category: "taco" }

    post "/api/v1/events", params: {event: event_params}
    event = Event.last
    
    assert_response :success
    expect(response).to be_successful
    expect(event.title).to eq(event_params[:title])
    expect(event.category).to eq(event_params[:category])
  end

  it "can update an existing event" do
    id = create(:event).id
    previous_title = Event.last.title
    event_params = { title: "React Meetup" }

    put "/api/v1/events/#{id}", params: {event: event_params}
    event = Event.find_by(id: id)
    
    expect(response).to be_successful
    expect(event.title).to_not eq(previous_title)
    expect(event.title).to eq("React Meetup")
  end
end  