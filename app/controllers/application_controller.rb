class ApplicationController < ActionController::API
    include ActionController::Cookies 
    before_action :authorize 
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity 

    private 

    def current_user 
        @current_user ||= Employee.find_by(id: session[:employee_id])
    end

    def authorize
        return render json: { errors: ["Not authorize customer"] }, status: :unauthorized unless current_user
    end

    def authorize_user
        user_can_see = current_user.boss?
        render json: { error: "Ah ah ah, you didn't say the magic word" }, status: :forbidden unless user_can_see
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
    end 
end
