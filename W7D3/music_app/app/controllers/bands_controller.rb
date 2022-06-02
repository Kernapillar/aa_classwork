class BandsController < ApplicationController
    def new
        @band = Band.new
        render :new
    end

    def create
        @band = Band.new(bands_params)
        if @band.save
            redirect_to band_url(@band)
        else
            render :new
        end
    end



    def edit
        @band = Band.find_by(name: params[:name])
        render :edit
    end



    def bands_params
        params.require(:band).permit(:id, :name) 
    end
end
