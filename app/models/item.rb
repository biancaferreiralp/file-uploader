class Item < ApplicationRecord
  belongs_to :merchant
  belongs_to :purchase

  validates :description, :price, presence: true
end
