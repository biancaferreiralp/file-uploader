class Purchaser < ApplicationRecord
  has_many :company_sales

  validates :name, presence: true
end
