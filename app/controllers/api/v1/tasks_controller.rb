class Api::V1::TasksController < ApplicationController

  def index
    event = Event.find(params[:event_id])
    render json: (event.tasks)
  end
  
  def show
    event = Event.find(params[:event_id])
    task = event.tasks.find_by!(id: params[:id])
    
    render json: (task)
  end

  def create
    event = Event.find(params[:event_id])
    event.tasks.create!(task_params)
    task = event.tasks.last

    render json: (task)
  end


  private

  def task_params
    params.permit(:name, :priority)
  end

end
