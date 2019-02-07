class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]

    def index 
      if params[:type_id]
        @products = Type.find(params[:type_id]).products
      elsif params[:designser_id]
        @product = Designer.find(params[:designer_id]).products
      else
        @products = Product.all
      end
      render json: @products
      end 
    
      def show 
        render json: @product
      end 

      def create 
        @user = User.find_by({id: params[:id] })

        if @user.admin
            @product = Product.create(product_params)
            render json: @product 
        else
        render json:{message: "unauthrize"}
        end 
      end

      def update 
        @product.update_attributes(product_params)
        render json: @product
      end 

      def destroy 
        @product.destroy
        render json: {message: "Success"}
      end 
    
      private 
      def set_product
        @product = Product.find(params[:id])
      end 
      
      def product_params
        params.require(:product).permit(:name, :description, :quantity, :price, :image )
      end
    end