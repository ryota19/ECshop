class SendMailer < ApplicationMailer

    def order_check(seller,cart_item,total_price)
        @seller = seller
        @cart_items = cart_item
        @total_price = total_price
        mail to: seller.email, from: "ryopugs1019@gmail.com", subject: "Your Order"
    end
end
