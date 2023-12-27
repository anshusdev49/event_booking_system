class EventsController < ApplicationController
  before_action :authenticate_user
  before_action :set_event, only: [:update, :destroy]

  def index
    events = Event.all
    render json: events, status: :ok
  end

  def create
    if current_user.event_organizer?
      event_organizer_id = current_user.id
      event = current_user.events.new(event_params)
      if event.save
        render json: event, status: :ok
      else
        render json: { message: "Not created"}, status: :unprocessable_entity
      end
    else
      render json: { message: "Your not authorized"}, status: :unprocessable_entity
    end
  end

  def update
    if current_user.event_organizer?
      if @event.update(event_params)
        render json: @event
      else
        render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "Your not authorized"}, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.event_organizer?
      if @event.destroy
        render json: {success: true}
      else
        render json: {success: false, errors: @event.errors.full_messages}
      end
    else
      render json: { message: "Your not authorized"}, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.permit(:name, :venue, :date, :event_organizer_id)
  end
end
