class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_cart
    helper_method :current_seller_order
    helper_method :current_seller_order_product
    before_action :login_required


    include SessionsHelper

    def image
        config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
    end

    private

    def current_cart
        @current_cart = Cart.find_by(seller_id:current_seller.id) unless current_seller.admin?
    end

    def current_seller_order
        @current_order = Order.where(seller_id:current_seller.id)
    end

    def current_seller_order_product
        @current_order_prodcuct = OrderProduct.where(seller_id:current_seller.id)
    end

    def login_required 
        redirect_to login_url unless current_seller
    end

    

end
