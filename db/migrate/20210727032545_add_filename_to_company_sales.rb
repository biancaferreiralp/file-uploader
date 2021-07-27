class AddFilenameToCompanySales < ActiveRecord::Migration[6.0]
  def change
    add_column :company_sales, :filename, :string
  end
end
