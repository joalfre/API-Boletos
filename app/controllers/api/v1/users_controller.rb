module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorized, only: [:auto_login]
      #before_action :authorized

      def index
        @users = User.all
        render json: {status: 'Exitoso', message: 'Usuarios Cargados', date: @users}, status: :ok
      end

      def create
        if validate_create != "ADMINISTRADOR"
         render json: {status: 'Error', message: 'Debes der ADMINISTRADOR'}, status: :ok
        else
          @user = User.create(user_params)
          if @user.valid?
            token = encode_token({user_id: @user.id})
            render json: {status: 'Exitoso', message: 'Usuario Creado', user: @user, token: token}
          else
            render json: {status: 'Fallido', message: 'Usuario NO Creado', date: @user.errors}, status: :unprocessable_entity
          end
        end
      end

      def show
        render json: {status: 'Exitoso', message: 'Usuario Cargado', date: @user}, status: :ok
      end

      def update
        if validate_create != "ADMINISTRADOR"
          render json: {status: 'Error', message: 'Debes der ADMINISTRADOR'}, status: :ok
        else
          if @venue.update(user_params)
            render json: {status: 'Exitoso', message: 'Usuario Actualizado', date: @user}, status: :ok
          else
            render json: {status: 'Fallido', message: 'Usuario NO Actualizado', date: @user.errors}, status: :unprocessable_entity
          end
        end
      end

      def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          token = encode_token({user_id: @user.id})
          render json: {user: @user, token: token}
          #render json: {status: 'Exitoso', message: 'Usuario Logueado', user: @user, token: token}
        else
          render json: {status: 'Fallido', message: 'Usuario No existe'}, status: :unprocessable_entity
        end
      end

      def auto_login
        render json: @user
      end

      private

      def user_params
        #params.permit(:username, :password, :rol)
        params.require(:user).permit(:username, :password, :rol)
      end

      def set_user
        @user = User.find(params[:id])
      end

      def validate_create
        return @user.rol
      end
    end
  end
end
