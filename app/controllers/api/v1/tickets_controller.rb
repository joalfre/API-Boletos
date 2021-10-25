module Api
  module V1
    class TicketsController < ApplicationController
      before_action :set_event
      before_action :set_event_ticket, only: [:show, :update, :destroy]

      def index
        render json: {status: 'Exitoso', message: 'Tickets Cargados', date: @event.tickets}, status: :ok
      end

      def create
        @ticket = @event.tickets.new(ticket_params, )
        if verify_quantities(params[:event_id], params[:quantities]) < 0
          render json: {status: 'Error', message: 'Supera el limite de entradas ', date: verify_quantities(params[:event_id], params[:quantities])}, status: :ok
        else
          if @ticket.save
            render json: {status: 'Exitoso', message: 'Ticket Creado', date: @ticket}, status: :ok
          else
            render json: {status: 'Fallido', message: 'ticket NO Creado', date: @ticket.errors}, status: :unprocessable_entity
          end
        end
      end

      def show
        render json: {status: 'Exitoso', message: 'Ticket Cargado', date: @ticket}, status: :ok
      end

      def update
        if @ticket.update(event_params)
          render json: {status: 'Exitoso', message: 'Ticket Actualizado', date: @ticket }, status: :ok
        else
          render json: {status: 'Fallido', message: 'Ticket NO Actualizado', date: @ticket.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        if @ticket.destroy
          render json: {status: 'Exitoso', message: 'Ticket Eliminado', date: @ticket}, status: :ok
        else
          render json: {status: 'Fallido', message: 'Ticket NO Eliminado', date: @ticket.errors}, status: :unprocessable_entity
        end
      end

      private
      def ticket_params
        params.permit(:cost, :quantities, [:event_id, :user_id])
      end

      def set_event
        @event = Event.find(params[:event_id])
      end

      def set_event_ticket
        @ticket = @event.tickets.find_by!(id: params[:id]) if @event
      end

      def verify_quantities(id_event, num_ticket)
        quantities = params[:quantities].to_i
        event = params[:event_id]
        total_ticket_parcial = 0
        tickets = Ticket.where("event_id = ?", event)
        tickets.each do |ticket|
          total_ticket_parcial += ticket["quantities"]
        end
        total_ticket_final = total_ticket_parcial + quantities
        evento = Event.find(event)
        total_capacity = evento.venue.capacity
        diponibles = total_capacity - total_ticket_final
        return  diponibles
      end
    end

  end
end
