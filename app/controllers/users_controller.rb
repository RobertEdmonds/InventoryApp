class UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :delete]

    def index 
        render json: User.all, status: :ok
    end

    def show
        render json: @user, status: :ok
    end

    def create 
        user = User.create!(user_params)
        render json: user, status: :created
    end

    def update
        @user.update!(user_params)
        render json: @user, status: :created
    end

    def destroy
        @user.destroy
        head :no_content
    end

    private

    def user_params
        params.permit(:email, :name, :phone_number, :address, :city, :state, :zip_code)
    end

    def find_user 
        @user = User.find(params[:id])
    end   
end
