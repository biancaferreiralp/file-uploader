class Merchant < ApplicationRecord
  belongs_to :company_sale
  has_many :items

  validates :name, :address, presence: true
end
