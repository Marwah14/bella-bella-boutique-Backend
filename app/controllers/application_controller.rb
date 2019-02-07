class ApplicationController < ActionController::API
    def require_token
        token = params.require(:auth_token)
        @current_user = User.find_by(auth_token: token)
    
        unless @current_user
          render json: {errors: "invalid token"}, status: :unauthorized
        end
      end
end
