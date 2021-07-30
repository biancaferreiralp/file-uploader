require 'test_helper'

class PurchaserTest < ActiveSupport::TestCase
  test "should not save purchaser without name" do
    purchaser = Purchaser.new
    assert_not purchaser.save, "Saved Purchaser without name"
  end
end
