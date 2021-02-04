class SessionsController < ApplicationController
  skip_before_action :login_required


  def new
  end

  def create
    seller = Seller.find_by(email: params[:session][:email].downcase)
    if seller && seller.authenticate(params[:session][:password])
      log_in seller 
      redirect_to products_path
    else
      render :new 
    end
  end

  def destroy
    log_out
    redirect_to root_url, notice: "ログアウトしました"
  end

  private

  def login_required
    redirect_to login_url unless current_seller
  end
end
