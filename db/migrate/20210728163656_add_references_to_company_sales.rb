class AddReferencesToCompanySales < ActiveRecord::Migration[6.0]
  def change
    add_reference :company_sales, :purchaser, null: false, foreign_key: true
    add_reference :company_sales, :merchant, null: false, foreign_key: true
    add_reference :company_sales, :item, null: false, foreign_key: true
  end
end
