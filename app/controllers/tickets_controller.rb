class TicketsController < ApplicationController
    before_action :authenticate_user

    def index
      tickets = Ticket.all
      render json: tickets, status: :ok
    end
  
    def create
      if current_user.event_organizer?
        ticket = current_user.tickets.new(ticket_params)
        if ticket.save!
          render json: ticket, status: :ok
        else
          render json: { message: "Not created"}, status: :unprocessable_entity
        end
      else
        render json: { message: "Your not authorized"}, status: :unprocessable_entity
      end
    end
  
    private
  
    def ticket_params
      params.permit(:price, :ticket_type, :event_id)
    end
  end