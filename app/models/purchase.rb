class Purchase < ApplicationRecord
  belongs_to :company_sale
  belongs_to :purchaser
  has_many :items

  validates :count, presence: true
end
