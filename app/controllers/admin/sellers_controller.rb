class Admin::SellersController < ApplicationController
  before_action :correct_seller,  only: [:edit, :update]
  before_action :admin_seller,    only: :destroy
  skip_before_action :login_required



  def index 
    @sellers = Seller.all
  end

  def show
    @seller = Seller.find(params[:id])
  end

  def new
    @seller = Seller.new
  end

  def edit
    @seller = Seller.find(params[:id])
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      log_in @seller 
      @cart = @seller.build_cart 
      @cart.save
      redirect_to admin_seller_url(@seller), nitice: "ユーザーを作成しました"
    else
      render :new 
    end

  end

  def update
    @seller = Seller.find(params[:id])

    if @seller.update(seller_params)
      redirect_to admin_seller_url(@seller), notice: "ユーザーを更新しました"
    else
      render :edit 
    end

  end

  def destroy
      @seller = Seller.find(params[:id])
      @seller.destroy
      redirect_to admin_sellers_url, notice: "ユーザーを削除しました"
  end

  def logged_in_user
    unless logged_in?
      redirect_to login_url, notice: "ログインしてください" 
    end
  end

  private
  def seller_params
    params.require(:seller).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_seller
    @seller = Seller.find(params[:id])
    unless current_seller?(@seller)
      redirect_to root_url, notice: "権限がありません"
    end
  end

  def admin_seller
    redirect_to(root_url)unless current_seller.admin?
  end
end
