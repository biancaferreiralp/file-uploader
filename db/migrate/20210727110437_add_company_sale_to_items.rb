class AddCompanySaleToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :company_sale, null: false, foreign_key: true
  end
end
