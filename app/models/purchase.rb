class Purchase < ApplicationRecord
  belongs_to :company_sale
  belongs_to :purchaser
  has_many :items, dependent: :destroy

  validates :count, presence: true
end
