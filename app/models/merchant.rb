class Merchant < ApplicationRecord
  belongs_to :company_sale
  has_many :items, dependent: :destroy

  validates :name, :address, presence: true
end
