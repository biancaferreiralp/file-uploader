require 'test_helper'

class CompanySaleTest < ActiveSupport::TestCase
  purchaser_name = "Bianca"
  item_description = "R$50 Pizza Cookie for $10"
  item_price = 10.00
  purchase_count = 2
  merchant_address = "123 Sweet St"
  merchant_name = "MIA Cookies"

  test "should not save company sale without purchaser name" do
    user = User.create(email: "contato@miacookies.com", password: "miacookie")
    purchaser = Purchaser.find_or_create_by(name: purchaser_name)
    merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
    item = Item.find_or_create_by(description: item_description, price: item_price, merchant_id: merchant.id)

    company_sale = CompanySale.new
    company_sale.item_description = item_description
    company_sale.item_price = item_price
    company_sale.purchase_count = purchase_count
    company_sale.merchant_address = merchant_address
    company_sale.merchant_name = merchant_name
    company_sale.purchaser_id = purchaser.id
    company_sale.merchant_id = merchant.id
    company_sale.item_id = item.id
    company_sale.user_id = user.id

    assert_not company_sale.save, "Saved Company Sale without purchaser name"
  end

  test "should not save company sale without item description" do
    user = User.create(email: "contato@miacookies.com", password: "miacookie")
    purchaser = Purchaser.find_or_create_by(name: purchaser_name)
    merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
    item = Item.find_or_create_by(description: item_description, price: item_price, merchant_id: merchant.id)

    company_sale = CompanySale.new
    company_sale.purchaser_name = purchaser_name
    company_sale.item_price = item_price
    company_sale.purchase_count = purchase_count
    company_sale.merchant_address = merchant_address
    company_sale.merchant_name = merchant_name
    company_sale.purchaser_id = purchaser.id
    company_sale.merchant_id = merchant.id
    company_sale.item_id = item.id
    company_sale.user_id = user.id

    assert_not company_sale.save, "Saved Company Sale without item description"
  end

  test "should not save company sale without item price" do
    user = User.create(email: "contato@miacookies.com", password: "miacookie")
    purchaser = Purchaser.find_or_create_by(name: purchaser_name)
    merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
    item = Item.find_or_create_by(description: item_description, price: item_price, merchant_id: merchant.id)

    company_sale = CompanySale.new
    company_sale.purchaser_name = purchaser_name
    company_sale.item_description = item_description
    company_sale.purchase_count = purchase_count
    company_sale.merchant_address = merchant_address
    company_sale.merchant_name = merchant_name
    company_sale.purchaser_id = purchaser.id
    company_sale.merchant_id = merchant.id
    company_sale.item_id = item.id
    company_sale.user_id = user.id

    assert_not company_sale.save, "Saved Company Sale without item price"
  end

  test "should not save company sale without purchase count" do
    user = User.create(email: "contato@miacookies.com", password: "miacookie")
    purchaser = Purchaser.find_or_create_by(name: purchaser_name)
    merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
    item = Item.find_or_create_by(description: item_description, price: item_price, merchant_id: merchant.id)

    company_sale = CompanySale.new
    company_sale.purchaser_name = purchaser_name
    company_sale.item_description = item_description
    company_sale.item_price = item_price
    company_sale.merchant_address = merchant_address
    company_sale.merchant_name = merchant_name
    company_sale.purchaser_id = purchaser.id
    company_sale.merchant_id = merchant.id
    company_sale.item_id = item.id
    company_sale.user_id = user.id

    assert_not company_sale.save, "Saved Company Sale without purchase count"
  end

  test "should not save company sale without merchant address" do
    user = User.create(email: "contato@miacookies.com", password: "miacookie")
    purchaser = Purchaser.find_or_create_by(name: purchaser_name)
    merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
    item = Item.find_or_create_by(description: item_description, price: item_price, merchant_id: merchant.id)

    company_sale = CompanySale.new
    company_sale.purchaser_name = purchaser_name
    company_sale.item_description = item_description
    company_sale.item_price = item_price
    company_sale.purchase_count = purchase_count
    company_sale.merchant_name = merchant_name
    company_sale.purchaser_id = purchaser.id
    company_sale.merchant_id = merchant.id
    company_sale.item_id = item.id
    company_sale.user_id = user.id

    assert_not company_sale.save, "Saved Company Sale without merchant address"
  end

  test "should not save company sale without merchant name" do
    user = User.create(email: "contato@miacookies.com", password: "miacookie")
    purchaser = Purchaser.find_or_create_by(name: purchaser_name)
    merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
    item = Item.find_or_create_by(description: item_description, price: item_price, merchant_id: merchant.id)

    company_sale = CompanySale.new
    company_sale.purchaser_name = purchaser_name
    company_sale.item_description = item_description
    company_sale.item_price = item_price
    company_sale.purchase_count = purchase_count
    company_sale.merchant_address = merchant_address
    company_sale.purchaser_id = purchaser.id
    company_sale.merchant_id = merchant.id
    company_sale.item_id = item.id
    company_sale.user_id = user.id

    assert_not company_sale.save, "Saved Company Sale without merchant name"
  end

  test "should not save company sale without purchaser" do
    user = User.create(email: "contato@miacookies.com", password: "miacookie")
    purchaser = Purchaser.find_or_create_by(name: purchaser_name)
    merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
    item = Item.find_or_create_by(description: item_description, price: item_price, merchant_id: merchant.id)

    company_sale = CompanySale.new
    company_sale.purchaser_name = purchaser_name
    company_sale.item_description = item_description
    company_sale.item_price = item_price
    company_sale.purchase_count = purchase_count
    company_sale.merchant_address = merchant_address
    company_sale.merchant_name = merchant_name
    company_sale.merchant_id = merchant.id
    company_sale.item_id = item.id
    company_sale.user_id = user.id

    assert_not company_sale.save, "Saved Company Sale without Purchaser"
  end

  test "should not save company sale without merchant" do
    user = User.create(email: "contato@miacookies.com", password: "miacookie")
    purchaser = Purchaser.find_or_create_by(name: purchaser_name)
    merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
    item = Item.find_or_create_by(description: item_description, price: item_price, merchant_id: merchant.id)

    company_sale = CompanySale.new
    company_sale.purchaser_name = purchaser_name
    company_sale.item_description = item_description
    company_sale.item_price = item_price
    company_sale.purchase_count = purchase_count
    company_sale.merchant_address = merchant_address
    company_sale.merchant_name = merchant_name
    company_sale.purchaser_id = purchaser.id
    company_sale.item_id = item.id
    company_sale.user_id = user.id

    assert_not company_sale.save, "Saved Company Sale without Merchant"
  end

  test "should not save company sale without item" do
    user = User.create(email: "contato@miacookies.com", password: "miacookie")
    purchaser = Purchaser.find_or_create_by(name: purchaser_name)
    merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
    item = Item.find_or_create_by(description: item_description, price: item_price, merchant_id: merchant.id)

    company_sale = CompanySale.new
    company_sale.purchaser_name = purchaser_name
    company_sale.item_description = item_description
    company_sale.item_price = item_price
    company_sale.purchase_count = purchase_count
    company_sale.merchant_address = merchant_address
    company_sale.merchant_name = merchant_name
    company_sale.purchaser_id = purchaser.id
    company_sale.merchant_id = merchant.id
    company_sale.user_id = user.id

    assert_not company_sale.save, "Saved Company Sale without Item"
  end

  test "should not save company sale without user" do
    user = User.create(email: "contato@miacookies.com", password: "miacookie")
    purchaser = Purchaser.find_or_create_by(name: purchaser_name)
    merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
    item = Item.find_or_create_by(description: item_description, price: item_price, merchant_id: merchant.id)

    company_sale = CompanySale.new
    company_sale.purchaser_name = purchaser_name
    company_sale.item_description = item_description
    company_sale.item_price = item_price
    company_sale.purchase_count = purchase_count
    company_sale.merchant_address = merchant_address
    company_sale.merchant_name = merchant_name
    company_sale.purchaser_id = purchaser.id
    company_sale.merchant_id = merchant.id
    company_sale.item_id = item.id

    assert_not company_sale.save, "Saved Company Sale without User"
  end
end
