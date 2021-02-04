class ProductsController < ApplicationController
  before_action :ensure_correct_seller, {only: [:new, :create, :edit, :destroy]}
  before_action :ensure_correct_admin, {only: [:show]}
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit 
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "商品を出品しました"
    else
      render :new
    end

  end

  def update 
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_url, notice: "商品を更新しました"
    else
      render :edit
    end

  end

  def ensure_correct_seller
    if current_seller.admin?

    else
      redirect_to root_url, notice: "アクセス権限がありません"
    end
  end

  def destroy
    product = Product.find(params[:id])
      if cart_item = CartItem.find_by(product_id: product.id)
        cart_item.destroy
      end
    product.destroy 
    redirect_to products_url, notice: "投稿を削除しました"
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :image)
  end

  def ensure_correct_admin
    if current_seller.admin?
      redirect_to root_url, notice: "使用できません"
    end
  end
end
