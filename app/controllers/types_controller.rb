class TypesController < ApplicationController
    before_action :set_type, only: [:show, :update, :destroy]

    def index 
      if params[:category_id]
        @types = Category.find(params[:category_id]).types
      else 
        @types = Type.all
      end
      render json: @types
      end 
    
      def show 
        render json: @type
      end 

      def create 
        @type = Type(type_params)
        render json: @type
      end 

      def update 
        @type.update_attributes(type_params)
        render json: @type
      end 

      def destroy 
        @type.destroy
        render json: {message: "Success"}
      end 
    
      private 
      def set_type
        @type = Type.find(params[:id])
        
      end 
      
      def type_params
        params.require(:type).permit(:name)
      end
end
