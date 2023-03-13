class RentedSamplesController < ApplicationController
    before_action :find_user, only: [:index]

    def index 
        render json: RentedSample.all, status: :ok
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
