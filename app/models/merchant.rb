class Merchant < ApplicationRecord
  has_many :company_sales
  has_many :items, dependent: :destroy
  has_many :purchasers, -> { distinct }, through: :company_sales

  validates :name, :address, presence: true

  def total_income
    total_income = 0
    self.company_sales.each { |s| total_income += s.gross_income }
    total_income
  end
end
