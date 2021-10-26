module Api
  module V1
    class EventsController < ApplicationController

      before_action :set_event, only: [:show, :update, :destroy]
      before_action :authorized

      def index
        @events = Event.all
        render json: {status: 'Exitoso', message: 'eventos Cargados', date: @events}, status: :ok
      end

      def show
        render json: {status: 'Exitoso', message: 'Evento Cargado', date: @event}, status: :ok
      end

      def create
        @event = @user.events.new(event_params)
        if @event.save
          render json: {status: 'Exitoso', message: 'Evento Creado', date: @event}, status: :ok
        else
          render json: {status: 'Fallido', message: 'Evento NO Creado', date: @event.errors}, status: :unprocessable_entity
        end
      end

      def update
        if @event.update(event_params)
          render json: {status: 'Exitoso', message: 'Evento Actualizado', date: @event }, status: :ok
        else
          render json: {status: 'Fallido', message: 'Evento NO Actualizado', date: @event.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        if @event.destroy
          render json: {status: 'Exitoso', message: 'Evento Eliminado', date: @event}, status: :ok
        else
          render json: {status: 'Fallido', message: 'Evento NO Eliminado', date: @event.errors}, status: :unprocessable_entity
        end
      end

      private

      def event_params
        params.require(:event).permit(:name, :event_date, :event_time, :status, :user_id, :venue_id)
      end
      def set_event
        @event = Event.find(params[:id])
      end
    end

  end
end
