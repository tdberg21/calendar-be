class Api::V1::EventsController < ApplicationController

  def index
    render json: Event.all
  end

  def show
    render json: Event.find(params[:id])
  end

  def create
    puts event_params
    event = Event.new(event_params)
    if event.save
      render json: {status: 'SUCCESS', data: event}, status: :ok
    else
      render json: {status: 'ERROR', data: event.errors}, status: :unprocessable_entity  
    end
  end

  def update
    event = Event.find(params[:id])

    if event.update_attributes(event_params)
      render json: {status: 'SUCCESS', data: event}, status: :ok
    else
      render json: {status: 'ERROR', data: event.errors}, status: :unprocessable_entity         
    end
  end

  def destroy
    Event.delete(params[:id])
  end 

  private

  def event_params
    params.require(:event).permit(:title, :date, :time, :public, :category, :comments)
  end

end