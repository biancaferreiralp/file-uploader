class RemoveCompanySaleReferences < ActiveRecord::Migration[6.0]
  def change
    remove_reference :purchasers, :company_sale
    remove_reference :purchases, :company_sale
    remove_reference :merchants, :company_sale
    remove_reference :items, :company_sale
  end
end
