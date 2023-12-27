class BookingsController < ApplicationController
  before_action :authenticate_user
  before_action :set_ticket

  def ticket_book
    if current_user.customer?
      if @ticket && @ticket.availability > 0
        booking = current_user.bookings.new(event_id: params[:event_id], ticket_id: @ticket.id)
        if booking.save
          @ticket.update!(availability: @ticket.availability - 1)
          render json: { message: 'Ticket booked successfully' }, status: :created
        else
          render json: { error: 'Failed to create booking' }, status: :unprocessable_entity
        end
      else
        render json: { error: 'Ticket not available' }, status: :unprocessable_entity
      end
    else
      render json: { message: "You are not authorized" }, status: :unprocessable_entity
    end
  end

  private

  def set_ticket
    event = Event.find(params[:event_id])
    tickets = event.tickets
    @ticket = tickets.find_by(ticket_type: params[:ticket_type])
  end
end
