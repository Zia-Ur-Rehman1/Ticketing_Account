require "test_helper"

class CustomerSuppliersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_supplier = customer_suppliers(:one)
  end

  test "should get index" do
    get customer_suppliers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_supplier_url
    assert_response :success
  end

  test "should create customer_supplier" do
    assert_difference("CustomerSupplier.count") do
      post customer_suppliers_url, params: { customer_supplier: { air_line: @customer_supplier.air_line, current_date: @customer_supplier.current_date, customer: @customer_supplier.customer, deal: @customer_supplier.deal, passenger_name: @customer_supplier.passenger_name, purchase: @customer_supplier.purchase, ref_date: @customer_supplier.ref_date, reservation_num: @customer_supplier.reservation_num, reservation_type: @customer_supplier.reservation_type, sale: @customer_supplier.sale, sector: @customer_supplier.sector, supplier: @customer_supplier.supplier, travel_date: @customer_supplier.travel_date } }
    end

    assert_redirected_to customer_supplier_url(CustomerSupplier.last)
  end

  test "should show customer_supplier" do
    get customer_supplier_url(@customer_supplier)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_supplier_url(@customer_supplier)
    assert_response :success
  end

  test "should update customer_supplier" do
    patch customer_supplier_url(@customer_supplier), params: { customer_supplier: { air_line: @customer_supplier.air_line, current_date: @customer_supplier.current_date, customer: @customer_supplier.customer, deal: @customer_supplier.deal, passenger_name: @customer_supplier.passenger_name, purchase: @customer_supplier.purchase, ref_date: @customer_supplier.ref_date, reservation_num: @customer_supplier.reservation_num, reservation_type: @customer_supplier.reservation_type, sale: @customer_supplier.sale, sector: @customer_supplier.sector, supplier: @customer_supplier.supplier, travel_date: @customer_supplier.travel_date } }
    assert_redirected_to customer_supplier_url(@customer_supplier)
  end

  test "should destroy customer_supplier" do
    assert_difference("CustomerSupplier.count", -1) do
      delete customer_supplier_url(@customer_supplier)
    end

    assert_redirected_to customer_suppliers_url
  end
end
