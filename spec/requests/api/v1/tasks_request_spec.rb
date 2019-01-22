require 'rails_helper'

describe "Tasks API" do
  let!(:event) { create(:event) }
  let!(:tasks) { create_list(:task, 10, event_id: event.id) }

  
  it "sends a list of tasks" do
    get "/api/v1/events/#{event.id}/tasks"
    
    expect(response).to be_successful

    events = JSON.parse(response.body)

    expect(events.count).to eq(10)
  end

  it "can get one task by its id" do
    get "/api/v1/events/#{event.id}/tasks/#{tasks.first.id}"
    
    task1 = JSON.parse(response.body)

    expect(response).to be_successful
    expect(task1["id"]).to eq(11)
  end

  it "can create a new task" do
    task_params = { name: "Learn Ruby on Rails", priority: 5 }

    post "/api/v1/events/#{event.id}/tasks/", params: task_params
    
    assert_response :success
    expect(response).to be_successful

    task = JSON.parse(response.body)

    expect(task['name']).to eq(task_params[:name])
    expect(task['category']).to eq(task_params[:category])
  end

end
