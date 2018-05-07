require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
<<<<<<< HEAD
      post orders_url, params: { order: { client: @order.client, confirmed: @order.confirmed, reserve: @order.reserve } }
=======
      post orders_url, params: { order: { client: @order.client, confirmed: @order.confirmed, reservedate: @order.reservedate } }
>>>>>>> 3d075932b78a3d541d64c6b150d72419e6315be4
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
<<<<<<< HEAD
    patch order_url(@order), params: { order: { client: @order.client, confirmed: @order.confirmed, reserve: @order.reserve } }
=======
    patch order_url(@order), params: { order: { client: @order.client, confirmed: @order.confirmed, reservedate: @order.reservedate } }
>>>>>>> 3d075932b78a3d541d64c6b150d72419e6315be4
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
