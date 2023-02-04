class OrdersController < ApplicationController
    skip_before_action :authorize

    def index 
        render json: Order.all, status: :ok 
    end

    def create 
        order = current_user.orders.create!(order_params)
        render json: order, status: :created 
    end

end
