class Purchase < ApplicationRecord
  has_many :items
  belongs_to :purchaser

  validates :count, presence: true
end
