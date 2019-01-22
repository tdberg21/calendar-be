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

  def update
    task_to_update = Task.where(event_id: params[:event_id], id: params[:id])
    task_to_update.update(task_params)

    render json: (task_to_update)
  end

  def destroy
    event = Event.find(params[:event_id])
    task = event.tasks.find_by!(id: params[:id])

    task.destroy

    render json: { status: 'SUCCESS', message: 'DELETED TASK' }
  end


  private

  def task_params
    params.permit(:name, :priority)
  end

end
