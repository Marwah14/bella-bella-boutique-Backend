class DesignersController < ApplicationController
    before_action :set_cart, only: [:show, :update, :destroy]

    def index 
      if params[:product_id]
        @designers = Products.find(params[:product_id]).designers
      else
        @designers = Designer.all
      end
        render json: @designers
      end 
    
      def show 
        render json: @designer
      end 

      def create 
        @designer = Designer.create(designer_params)
        render json: @designer
      end 
    
      def update 
        @designer.update_attributes(designer_params)
        render json: @designer
      end 
    
      def destroy 
        @designers.destroy 
        render json: { message: "success" }
      end
    
    
      private 
      def set_designer
        @designers = Designer.find(params[:id])
      end 
      
      def designer_params
    params.require(:designer).permit(:name)
      end
end
