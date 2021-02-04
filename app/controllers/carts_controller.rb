class CartsController < ApplicationController
    before_action :admin_seller, {only: [:index]}
    

    def index
        @cart = current_cart.cart 
        @cart_items = @cart.cart_items
    end

    def show
        @cart_items = CartItem.where(cart_id:current_cart.id)
        @total_price = @cart_items.calc_total_price(@cart_items)

    end

    def add_item
        
        @cart = current_seller.cart 
        @cart_item = current_cart.cart_items.create(product_id: params[:product_id])
       

        @cart_item.quantity += params[:product][:quantity].to_i
        @cart_item.save
        redirect_to current_cart
    end

    def update_item
        @cart_item.update(quantity: params[:quantity].to_i)
        redirect_to current_cart
    end

    private

    def setup_cart_item!
        @cart_item = CartItem.find_by(cart_id: current_cart.id,product_id: params[:product_id])
    end

    def admin_seller 
        redirect_to(root_url)unless current_seller.admin?
      end
end
