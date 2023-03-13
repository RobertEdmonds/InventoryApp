class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    before_action :authorize_employee, only: [:create, :update, :destroy]

    def index
        render json: Product.all, status: :ok
    end

    def show
        render json: @product, status: :ok
    end

    def create 
        product = Product.create!(product_params)
        render json: product, status: :created
    end

    def update
        @product.update!(product_params)
        render json: @product, status: :created
    end

    def destroy
        @product.destroy
        head :no_content
    end

    private

    def product_params
        params.permit(:name, :description, :cost, :inventory, :color)
    end

    def set_product
        @product = Product.find(params[:id])
    end

    def authorize_employee 
        employee_can_modify = current_user.boss?
        render json: { error: "No touchy!" }, status: :forbidden unless user_can_modify
    end
end
