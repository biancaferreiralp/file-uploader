class CompanySale < ApplicationRecord
  belongs_to :user
  has_many :purchasers, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :merchants, dependent: :destroy
  has_many :items, dependent: :destroy

  validates :purchaser_name, :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name, presence: true
end
