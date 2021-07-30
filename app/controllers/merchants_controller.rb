class MerchantsController < ApplicationController
  def index
    @merchants = current_user.merchants
  end

  def show
    @merchant = Merchant.find(params[:id])
    @items = @merchant.items
    @company_sales = @merchant.company_sales
    @purchasers = @merchant.purchasers
  end
end
