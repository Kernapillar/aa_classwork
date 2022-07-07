class Api::SessionsController < ApplicationController
    def create 
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if !@user
            render json: ['Invalid  credentials'], status: 401
        else
            login!(@user)
            render :show
        end  
    end

    def destroy
        logout!
        render {}
    end
end
