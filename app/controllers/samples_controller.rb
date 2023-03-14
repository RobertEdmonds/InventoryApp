class SamplesController < ApplicationController
    before_action :find_sample, only: [:show, :update, :destroy]

    def index
        render json: Sample.all, status: :ok
    end

    def show
        render json: @sample, status: :ok
    end

    def create
        sample = Sample.create!(sample_params)
        render json: sample, status: :created
    end

    def update
        @sample.update!(sample_params)
        render json: @sample, status: :created
    end

    def destroy
        @sample.destroy
        head :no_content
    end

    private

    def sample_params
        params.permit(:product_id, :inventory)
    end

    def find_sample
        @sample = Sample.find(params[:id])
    end

end
