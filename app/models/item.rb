class Item < ApplicationRecord
  has_many :company_sales
  belongs_to :merchant

  validates :description, :price, presence: true
end
