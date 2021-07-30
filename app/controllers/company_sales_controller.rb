class CompanySalesController < ApplicationController
  def index
    @company_sales = current_user.company_sales
    @purchasers = current_user.purchasers
    @merchants = current_user.merchants
    @total_income = 0
    @company_sales.each { |s| @total_income += s.gross_income }
  end

  def import
    file = params[:file]

    CSV.foreach(file.path, headers: true, col_sep: "\t") do |row|
      data = row.to_hash
      data.keys.each { |key| data[key.tr(" ", "_")] = data.delete(key) }

      create_associate_data(data["purchaser_name"], data["merchant_name"], data["merchant_address"], data["item_description"], data["item_price"])

      data["user_id"] = current_user.id
      data["merchant_id"] = @merchant.id
      data["purchaser_id"] = @purchaser.id
      data["item_id"] = @item.id

      company_sale = CompanySale.create(data)
    end
    redirect_to company_sales_path
  end

  private

  def create_associate_data(purchaser_name, merchant_name, merchant_address, item_description, item_price)
    @purchaser = Purchaser.find_or_create_by(name: purchaser_name)
    @merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
    @item = Item.find_or_create_by(description: item_description, price: item_price.to_f, merchant_id: @merchant.id)
  end
end
