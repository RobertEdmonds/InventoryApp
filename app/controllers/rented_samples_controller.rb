class RentedSamplesController < ApplicationController
    before_action :find_user, only: [:index]

    def index 
        render json: RentedSample.all, status: :ok
    end

    def show
        rented_samples = RentedSample.find(params[:id])
        render json: rented_samples, status: :ok
    end

    def create 
        rs = RentedSample.create!(rented_samples_params)
        render json: rs, status: :created
    end
    private

    def rented_samples_params 
        params.permit(:user_id, :sample_id)
    end

    def find_user 
        @active_user = User.find(params[:user_id])
        render json: { error: "You have not submitted customer information"}, status: :forbidden unless @active_user
    end 
end
