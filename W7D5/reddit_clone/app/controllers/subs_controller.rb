class SubsController < ApplicationController
    before_action :require_logged_in
    before_action :is_moderator?, only: [:edit, :create, :destroy]

    def index
        @subs = Sub.all
        render :index
    end

    def new
        @sub = Sub.new
        render :new
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save
            redirect_to subs_url
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @user = User.find_by(id: params[:user_id])
        if current_user == @user
            @sub = Sub.find_by(id: params[:id])
            render :edit
        else
            flash[:errors] = ['Fuck Off']
            redirect_to subs_url
        end
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.update
            redirect_to subs_url
        else
            flash[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def destroy
        @user = User.find_by(id: params[:user_id])
        if @user == current_user
            @sub.destroy
            redirect_to subs_url
        else
            flash[:errors] = ["Fuck Off"]
            redirect_to subs_url
        end
    end

    private

    def is_moderator?
        return true if current_user.id == params[:moderator_id]
    end

    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
