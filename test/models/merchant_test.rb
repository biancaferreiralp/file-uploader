require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "should not save merchant without name" do
    merchant = Merchant.new
    merchant.address = "123 Sweet St"
    assert_not merchant.save, "Saved Merchant without name"
  end

  test "should not save merchant without address" do
    merchant = Merchant.new
    merchant.name = "Mia Cookies"
    assert_not merchant.save, "Saved Merchant without address"
  end
end
