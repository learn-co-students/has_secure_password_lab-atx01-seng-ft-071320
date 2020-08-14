class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(name: login_params[:name])
        return head(:forbidden) unless @user.authenticate(login_params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private
    def login_params
        params.require(:user).permit(:name, :password)
    end
end