class RemoveColumnsFromCompanySales < ActiveRecord::Migration[6.0]
  def change
    remove_reference :company_sales, :purchaser
    remove_reference :company_sales, :purchase
    remove_reference :company_sales, :merchant
    remove_reference :company_sales, :item
  end
end
