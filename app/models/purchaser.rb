class Purchaser < ApplicationRecord
  belongs_to :company_sale
  has_many :purchases

  validates :name, presence: true
end
