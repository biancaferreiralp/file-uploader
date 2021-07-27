class Purchaser < ApplicationRecord
  belongs_to :company_sale
  has_many :purchases, dependent: :destroy

  validates :name, presence: true
end
