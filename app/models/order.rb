class Order < ApplicationRecord
    has_many :cart_item, dependent: :destroy
    has_one :seller
    has_many :order_products

    enum status: { 入金待ち: 0, 発送待ち: 1, 発送完了: 2 }

    def chenge_status!
        if 入金待ち?
            発送待ち!
        elsif 発送待ち? || 発送完了?
            発送完了!
        end
    end

end
