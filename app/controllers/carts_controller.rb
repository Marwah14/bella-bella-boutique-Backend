class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :update, :destroy]
    before_action :require_token

    def index 
        if params[:user_id]
          @carts = Users.find(params[:product_id]).carts
        else
          @carts = Cart.all
      end 
      render json: @carts
    end
    
      def show 
        render json: @cart
      end 


      def update 
        @cart.update_attributes(cart_params)
        render json: @cart
      end 

      def destroy 
        @cart.destroy
        render json: {message: "Success"}
      end 
    
      private 
      def set_cart
         @carts= Cart.find(params[:id])
      end 
      
      def cart_params
        params.require(:cart).permit(:product_id, :user_id)
      end
end
