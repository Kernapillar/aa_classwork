class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ['Invalid Email/Password']
            render :new
        end
    end

    def destroy
        logout!
        flash[:message] = ["Logout Successful!"]
        redirect_to new_session_url
    end

end
