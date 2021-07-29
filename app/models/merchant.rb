class Merchant < ApplicationRecord
  has_many :company_sales
  has_many :items, dependent: :destroy
  has_many :purchasers, through: :company_sales

  validates :name, :address, presence: true
end
