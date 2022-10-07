class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        else
            render json: {error: "Unauthorized"}, status: 401
        end
    end

    def destroy
        session.delete :user_id
        head 204
    end
end
