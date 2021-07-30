class PurchasersController < ApplicationController
  def index
    @purchasers = current_user.purchasers
  end

  def show
    @purchaser = Purchaser.find(params[:id])
    @purchases = @purchaser.company_sales
    @merchants = @purchaser.merchants
  end
end
