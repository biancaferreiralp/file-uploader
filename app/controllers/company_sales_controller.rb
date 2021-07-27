class CompanySalesController < ApplicationController
  before_action :set_company_sale, only: [:edit, :update, :destroy]

  def index
    @company_sales = current_user.company_sales.all

    @total_income = 0
    @company_sales.each do |s|
      @total_income += s.item_price * s.purchase_count
    end
  end

  def new
    @company_sale = CompanySale.new
  end

  def create
    @company_sale = CompanySale.new(company_sale_params)
    @company_sale.user = current_user

    if @company_sale.save
      create_associate_data(@company_sale, @company_sale.purchaser_name, @company_sale.purchase_count, @company_sale.merchant_name,
                            @company_sale.merchant_address, @company_sale.item_description, @company_sale.item_price)

      redirect_to company_sales_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company_sale.update(company_sale_params)
      update_associate_data(@company_sale.purchaser_name, @company_sale.purchase_count, @company_sale.merchant_name,
                            @company_sale.merchant_address, @company_sale.item_description, @company_sale.item_price)

      redirect_to company_sales_path
    else
      render :edit
    end
  end

  def destroy
    @company_sale.destroy
    redirect_to company_sales_path
  end

  def import
    file = params[:file]

    CSV.foreach(file.path, headers: true, col_sep: "\t") do |row|
      data = row.to_hash
      data.keys.each { |key| data[key.tr(" ", "_")] = data.delete(key) }
      data["user_id"] = current_user.id
      company_sale = CompanySale.create!(data)

      create_associate_data(company_sale, data["purchaser_name"], data["purchase_count"], data["merchant_name"], 
                            data["merchant_address"], data["item_description"], data["item_price"])
    end
    redirect_to company_sales_path
  end

  private
  
  def set_company_sale
    @company_sale = CompanySale.find(params[:id])
  end

  def company_sale_params
    params.require(:company_sale).permit(:purchaser_name, :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name)
  end

  def create_associate_data(company_sale, purchaser_name, purchase_count, merchant_name, merchant_address, item_description, item_price)
    purchaser = Purchaser.create!(name: purchaser_name, company_sale_id: company_sale.id)
    purchase = Purchase.create!(count: purchase_count.to_i, company_sale_id: company_sale.id, purchaser_id: purchaser.id)
    merchant = Merchant.create!(name: merchant_name, address: merchant_address, company_sale_id: company_sale.id)
    item = Item.create!(description: item_description, price: item_price.to_f, company_sale_id: company_sale.id, merchant_id: merchant.id, purchase_id: purchase.id)
  end

  def update_associate_data(purchaser_name, purchase_count, merchant_name, merchant_address, item_description, item_price)
    purchaser = Purchaser.update(name: purchaser_name)
    purchase = Purchase.update(count: purchase_count.to_i)
    merchant = Merchant.update(name: merchant_name, address: merchant_address)
    item = Item.update(description: item_description, price: item_price.to_f)
  end
end
