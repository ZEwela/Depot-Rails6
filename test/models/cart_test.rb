require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products

  test "duplicate products" do 
    cart = Cart.create
    cart.add_product(products(:ruby)).save
    assert_equal 1, cart.line_items.count
    cart.add_product(products(:ruby)).save
    assert_equal 1, cart.line_items.count
    cart.add_product(products(:two)).save
    assert_equal 2, cart.line_items.count
  end 

  test "cart price check" do 
    cart = Cart.create
    cart.add_product(products(:ruby)).save
    cart.add_product(products(:ruby)).save
    cart.add_product(products(:two)).save
    cart_price = cart.total_price
    products(:ruby).update(price: 20)
    cart.reload
    assert_equal cart_price, cart.total_price
  end 
end
