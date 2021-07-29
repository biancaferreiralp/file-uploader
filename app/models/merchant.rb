class Merchant < ApplicationRecord
  has_many :company_sales
  has_many :items, dependent: :destroy

  validates :name, :address, presence: true
end
