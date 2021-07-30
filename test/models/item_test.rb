require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "should not save item without description" do
    merchant = Merchant.find_or_create_by(name: "MIA Cookies", address: "123 Sweet St")
    item = Item.new
    item.price = 10.00
    item.merchant_id = merchant.id
    assert_not item.save, "Saved Item without description"
  end

  test "should not save item without price" do
    merchant = Merchant.find_or_create_by(name: "MIA Cookies", address: "123 Sweet St")
    item = Item.new
    item.description = "R$50 Pizza Cookie for $10"
    item.merchant_id = merchant.id
    assert_not item.save, "Saved Item without price"
  end

  test "should not save item without merchant" do
    item = Item.new
    item.description = "R$50 Pizza Cookie for $10"
    item.price = 10.00
    assert_not item.save, "Saved Item without Merchant"
  end
end
