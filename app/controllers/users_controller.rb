class UsersController < ApplicationController
    before_action :authorize, only: [:show]

    def create  
        user = User.create(user_params)

    end

    private

    def authorize
        return render json: { error:"Not authorized" }, status: :unauthorized unless session.include? :user_id
    end

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
