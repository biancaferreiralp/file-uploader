class AddColumnsToCompanySales < ActiveRecord::Migration[6.0]
  def change
    add_column :company_sales, :purchaser_name, :string
    add_column :company_sales, :item_description, :string
    add_column :company_sales, :item_price, :float
    add_column :company_sales, :purchase_count, :integer
    add_column :company_sales, :merchant_address, :string
    add_column :company_sales, :merchant_name, :string
  end
end
