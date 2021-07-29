class MerchantsController < ApplicationController
  def index
    @merchants = current_user.merchants
  end

  def show
    @merchant = Merchant.find(params[:id])
    @items = @merchant.items
    @company_sales = @merchant.company_sales
    @purchasers = @merchant.purchasers
    @total_income = 0
    @company_sales.each do |s|
      @total_income += s.item_price * s.purchase_count
    end
  end
end
