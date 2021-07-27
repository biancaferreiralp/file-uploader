class Item < ApplicationRecord
  belongs_to :merchant
  belongs_to :purchase
end
