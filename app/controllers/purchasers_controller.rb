class PurchasersController < ApplicationController
  def index
    @purchasers = current_user.purchasers
  end

  def show
    @purchaser = Purchaser.find(params[:id])
    @purchases = @purchaser.company_sales
    @total_spent = 0
    @purchases.each do |s|
      @total_spent += s.item_price * s.purchase_count
    end
  end
end
