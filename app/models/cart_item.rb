class CartItem < ApplicationRecord
    belongs_to :product
    belongs_to :cart

    def self.calc_total_price(cart_items)
        total_price = 0
        cart_items.each do |cart_item|
            total_price += cart_item.product.price * cart_item.quantity
        end

        return total_price
    end
end
