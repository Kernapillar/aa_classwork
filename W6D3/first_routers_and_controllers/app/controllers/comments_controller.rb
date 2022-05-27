class CommentsController < ApplicationController
    def index
        @comments = Comment.all
        render json: @comments
    end

 
    def create
        comment = Comment.new(comment_params)
        if comment.save 
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        @comment = Comment.find(params[:id])
        # render json: @user
        @comment.destroy
        redirect_to comments_url
        
    end

      private 

    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id, :body)
    end
end
