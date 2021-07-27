class UpdateColumnsOnCompanySales < ActiveRecord::Migration[6.0]
  def change
    add_reference :company_sales, :purchaser, null: false, foreign_key: true
    add_reference :company_sales, :purchase, null: false, foreign_key: true
    add_reference :company_sales, :merchant, null: false, foreign_key: true
    add_reference :company_sales, :item, null: false, foreign_key: true

    remove_column :company_sales, :purchaser_name, :string
    remove_column :company_sales, :item_description, :string
    remove_column :company_sales, :item_price, :float
    remove_column :company_sales, :purchase_count, :integer
    remove_column :company_sales, :merchant_address, :string
    remove_column :company_sales, :merchant_name, :string
    remove_column :company_sales, :filename, :string
  end
end
