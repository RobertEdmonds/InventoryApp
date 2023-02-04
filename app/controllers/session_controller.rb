class SessionController < ApplicationController
    skip_before_action :authorize, only: [:create] 

    def create 
        employee = Employee.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:employee_id] = employee.id 
            render json: user, status: :created 
        else
            render json: {errors: ["Password or Name doesn't match our file"]}, status: :unauthorized
        end
    end

    def destroy 
        session.delete :employee_id
        head :no_content
    end
end
