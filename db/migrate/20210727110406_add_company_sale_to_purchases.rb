class AddCompanySaleToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchases, :company_sale, null: false, foreign_key: true
  end
end
