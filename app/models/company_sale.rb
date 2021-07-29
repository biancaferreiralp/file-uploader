class CompanySale < ApplicationRecord
  belongs_to :user
  belongs_to :purchaser
  belongs_to :merchant
  belongs_to :item

  validates :purchaser_name, :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name, presence: true
end
