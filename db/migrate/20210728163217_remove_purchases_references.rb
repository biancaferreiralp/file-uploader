class RemovePurchasesReferences < ActiveRecord::Migration[6.0]
  def change
    remove_reference :items, :purchase
  end
end
