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
      redirect_to company_sales_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company_sale.update(company_sale_params)
      redirect_to company_sales_path
    else
      render :edit
    end
  end

  def destroy
    @company_sale.destroy
    redirect_to company_sales_path
  end

  private
  
  def set_company_sale
    @company_sale = CompanySale.find(params[:id])
  end

  def company_sale_params
    params.require(:company_sale).permit(:purchaser_name, :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name)
  end
end
