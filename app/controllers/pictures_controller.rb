class PicturesController < ApplicationController
    skip_before_action :authorize, only: [:index]

    def index 
        render json: Picture.all, status: :ok
    end

    def create 
        picture = Picture.create!(picture_params)
        render json: picture, status: :created
    end

    def destroy
        picture = Picture.find(params[:id])
        picture.destroy
        head :no_content
    end

    private 

    def picture_params 
        params.permit(:picture_url, :product_id)
    end
end
