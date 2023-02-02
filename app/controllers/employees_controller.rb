class EmployeesController < ApplicationController
    skip_before_action :authorize, only: [:create, :index]
    before_action :authorize_user, only: [:update_employee] 
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity 

    def index 
        render json: Employee.all, status: :ok 
    end

    def create
        if employee.amount_of_logins == 0
            employee = Employee.create!(employee_params)
        else
            employee = Employee.update!(employee_params)
            session[:employee_id] = employee.id 
        end
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
        params.permit(:name, :phone_number)
    end

    def update_employee_params 
        params.permit(:boss)
    end

    def authorize_user
        user_can_see = current_user.employee?
        render json: { error: "Ah ah ah, you didn't say the magic word" }, status: :forbidden unless user_can_see
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
    end
end
