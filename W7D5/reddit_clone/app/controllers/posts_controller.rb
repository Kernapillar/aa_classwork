class PostsController < ApplicationController

    def index

    end

    def show

    end

    def new

    end

    def create

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
    end

    
end
