class OrdersController < ApplicationController
    before_action :ensure_correct_seller, {only: [:index]}

    def index
        @all_orders = Order.all
        @orders = Order.all
        @order_products = OrderProduct.all
    end

    def show
        @all_orders = Order.all
        @order_products = OrderProduct.where(seller_id:current_seller.id) 
    end


    def new
        @cart_items = current_cart.cart_items
        @total_price = @cart_items.calc_total_price(@cart_items)
        @cart = current_cart
        if @cart.cart_items.empty?
            redirect_to root_url, notice: 'カートの中身は空です'
        end
        @order = Order.new
    end

    def confirm
        @cart_items = current_cart.cart_items
        @order = Order.new(order_params)
        render :new if @order.invalid?
    end

    def create
        @cart_items = CartItem.where(cart_id:current_cart.id)
        @order = Order.new(order_params)
        respond_to do |format|
            if params[:back]
                format.html { redirect_to current_cart }

             elsif 
                @order.seller_id = current_seller.id 
                @order.name = current_seller.name
                @order.email = current_seller.email 
                @order.save
                @total_price = @cart_items.calc_total_price(@cart_items)

                @cart_items.each do |item|
                    order_product = OrderProduct.create
                    order_product.order_id = @order.id 
                    order_product.seller_id = current_seller.id 
                    order_product.product_id = item.product_id 
                    order_product.quantity = item.quantity   
                    order_product.status = @order.status
                    order_product.price = item.product.price 
                    order_product.save
                end

                SendMailer.order_check(current_seller,@cart_items,@total_price).deliver
                @cart_items.each do |item|
                    CartItem.delete(item.id)
                end

                format.html {redirect_to :products, notice: "ご注文内容をメールで送信いたしました"}
                flash[:info] = "ご注文内容をメールで送信いたしました"
            else
                format.html { render :new }
            end
        end
        
    end

    def destroy
        @order.destroy 
    end

    def chenge_status
        @all_orders = Order.all 
        @order = Order.find(params[:id]  ||  params[:order_id])
        @order.chenge_status!
        redirect_to orders_path, notice: '注文ステータスが更新されました'
    end

    def ensure_correct_seller
        if current_seller.admin?

        else
            redirect_to root_url, notice: 'アクセス権限がありません'
        end
    end


    private

    def order_params
        params.require(:order).permit(:address)
    end
end
