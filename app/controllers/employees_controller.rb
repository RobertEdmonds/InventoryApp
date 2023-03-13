class EmployeesController < ApplicationController
    before_action :authorize_user, only: [:index, :create] 
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity 

    def index 
        render json: Employee.all, status: :ok 
    end

    def create
        employee = Employee.update!(employee_params)
        session[:employee_id] = employee.id 
        render json: employee, status: :created 
    end

    def show 
        current_user = Employee.find(session[:employee_id])
        render json: current_user
    end

    def update
        employee = Employee.find(session[:employee_id])
        employee.update(employee_params)
        render json: employee, status: :created 
    end

    def update_employee
        employee = Employee.find(params[:id])
        employee.update(update_employee_params)
        render json: employee, status: :created 
    end

    private 

    def employee_params 
        params.permit(:name, :phone_number, :password, :password_confirmation, username:)
    end

    def update_employee_params 
        params.permit(:boss, :password, :password_confirmation)
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
    end
end
