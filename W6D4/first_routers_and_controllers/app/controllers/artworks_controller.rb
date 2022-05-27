class ArtworksController < ApplicationController
    def index
        if params[:user_id]
            render json: Artwork.get_user_artwork(params[:user_id])
        else
            @artworks = Artwork.all
            render json: @artworks
        end
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save 
            render json: artwork
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show 
        @artwork = Artwork.find_by id: params[:id]
        render json: @artwork 
    end

    def update
        @artwork = Artwork.find_by id: params[:id]
        if @artwork.update(artwork_params)
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end 
    end

    def destroy
        @artwork = Artwork.find_by id: params[:id]
        @artwork.destroy
        redirect_to artworks_url
    end
    
    
    private 

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
