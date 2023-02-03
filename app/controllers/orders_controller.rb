class OrdersController < ApplicationController
    skip_before_action :authorize

    def index 
        render json: Order.all, status: :ok 
    end

    def create 
        
end
