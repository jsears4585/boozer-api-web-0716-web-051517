module Api
  module V1
    class AuthController < ApplicationController
      before_action :authorize_user!, only: [:show]

      def show
        render json: { username: current_user.username }
      end

      def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          token = issue_token(user_id: @user.id)
          render json: { username: @user.username, token: token }
        elsif
          render json: { error: 'Authentication failed' }, status: 422
        end
      end

    end
  end
end
