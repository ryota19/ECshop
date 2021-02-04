class OrderProductsController < ApplicationController

    def index
        @order_products = OrderProduct.all
    end

    def show
        @order_product = OrderProduct.find(params[:id])
        @order_products = OrderProduct.where(seller_id:current_seller.id)
    end

    def create
        @order = Order.create(order_product_params)
    end



    private
    def order_product_params 
        params.require(:order).permit(:name, :adress, :email)
    end
end
