module SessionsHelper

    def log_in(seller)
        session[:seller_id] = seller.id
    end

    def current_seller
        if session[:seller_id]
            @current_seller ||= Seller.find_by(id: session[:seller_id])
        end
    end

    def logged_in?
        !current_seller.nil?
    end

    def log_out
        session.delete(:seller_id)
        @current_seller = nil
        session[:cart_id] = nil
        
    end

    def current_seller?(seller)
        seller == current_seller
    end
end
