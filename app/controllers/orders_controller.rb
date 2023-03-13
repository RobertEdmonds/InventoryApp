class OrdersController < ApplicationController
    before_action :set_order, only: [:update, :show, :destroy]
    before_action :find_user, exclude: [:index]

    def index 
        render json: Order.all, status: :ok 
    end

    def show
        render json: @order, status: :ok
    end

    def create 
        order = current_user.orders.create!(order_params)
        render json: order, status: :created 
    end

    def update
        @order.update(order_params)
        render json: @order, status: :created 
    end

    def destroy
        @order.destroy
        head :no_content
    end

    private

    def order_params
        params.permit(:user_id, :product_id, :amount, :total_price)
    end

    def set_order 
        @order = Order.find(params[:id])
    end

    def find_user 
        @active_user = User.find(params[:user_id])
        render json: { error: "You have not submitted customer information"}, status: :forbidden unless @active_user
    end 

end
