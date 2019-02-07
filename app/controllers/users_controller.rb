class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    before_action :require_token, only: [:show]

  
      def show 
        if params[:id] == @current_user.id.to_s
          render json: @current_user 
        else 
          render json: { errors: "invalid user" }, status: :unauthorized
        end
      end 

      def create 
        @user = User.create!(user_params)
        render json: @user
      end 

      def update 
        @user.update_attributes(user_params)
        render json: @user
      end 

      def destroy 
      
      # get the user type by from the token 
      # if the type === admin 

        @user.destroy
        render json: {message: "Success"}

      #  if it is not 
      render json: {message: "forbidenn access"}
      end 
    
      private 
      def set_user
         @user = User.find(params[:id])
      end 
      
      def user_params
        params.require(:user).permit(:name, :email, :address, :password, :password_confirmation)
      end

end
