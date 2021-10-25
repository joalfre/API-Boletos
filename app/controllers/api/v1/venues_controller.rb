module Api
  module V1
    class VenuesController < ApplicationController
      before_action :authorized
      before_action :set_venue, only: [:show, :update, :destroy]

      def index
        @venues = Venue.all
        render json: {status: 'Exitoso', message: 'Venues Cargados', date: @venues}, status: :ok
      end

      def show
        render json: {status: 'Exitoso', message: 'Venue Cargado', date: @venue}, status: :ok
      end

      def create
        @venue = @user.venues.new(venue_params)
        if @venue.save
          render json: {status: 'Exitoso', message: 'Venue Creado', date: @venue}, status: :ok
        else
          render json: {status: 'Fallido', message: 'Venue NO Creado', date: @venue.errors}, status: :unprocessable_entity
        end
      end

      def update
        if @venue.update(venue_params)
          render json: {status: 'Exitoso', message: 'Venue Actualizado', date: @venue}, status: :ok
        else
          render json: {status: 'Fallido', message: 'Venue NO Actualizado', date: @venue.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        if @venue.destroy
          render json: {status: 'Exitoso', message: 'Venue Eliminado', date: @venue}, status: :ok
        else
          render json: {status: 'Fallido', message: 'Venue NO Eliminado', date: @venue.errors}, status: :unprocessable_entity
        end
      end

      private

      def venue_params
        params.require(:venue).permit(:name, :address, :capacity, :user => @user.id)
      end

      def set_venue
        @venue = Venue.find(params[:id])
      end
    end
  end
end

