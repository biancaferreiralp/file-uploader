class Purchaser < ApplicationRecord
  has_many :company_sales
  has_many :merchants, -> { distinct }, through: :company_sales

  validates :name, presence: true

  def total_spent
    total_spent = 0
    self.company_sales.each { |s| total_spent += s.gross_income }
    total_spent
  end
  
  def total_spent_on_company(merchant)
    total_spent_on_company = 0
    self.company_sales.where(merchant_id: merchant.id).each { |s| total_spent_on_company += s.gross_income }
    total_spent_on_company
  end
end
