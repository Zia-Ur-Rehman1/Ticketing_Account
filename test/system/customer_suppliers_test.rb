require "application_system_test_case"

class CustomerSuppliersTest < ApplicationSystemTestCase
  setup do
    @customer_supplier = customer_suppliers(:one)
  end

  test "visiting the index" do
    visit customer_suppliers_url
    assert_selector "h1", text: "Customer suppliers"
  end

  test "should create customer supplier" do
    visit customer_suppliers_url
    click_on "New customer supplier"

    fill_in "Air line", with: @customer_supplier.air_line
    fill_in "Current date", with: @customer_supplier.current_date
    fill_in "Customer", with: @customer_supplier.customer
    fill_in "Deal", with: @customer_supplier.deal
    fill_in "Passenger name", with: @customer_supplier.passenger_name
    fill_in "Purchase", with: @customer_supplier.purchase
    fill_in "Ref date", with: @customer_supplier.ref_date
    fill_in "Reservation num", with: @customer_supplier.reservation_num
    fill_in "Reservation type", with: @customer_supplier.reservation_type
    fill_in "Sale", with: @customer_supplier.sale
    fill_in "Sector", with: @customer_supplier.sector
    fill_in "Supplier", with: @customer_supplier.supplier
    fill_in "Travel date", with: @customer_supplier.travel_date
    click_on "Create Customer supplier"

    assert_text "Customer supplier was successfully created"
    click_on "Back"
  end

  test "should update Customer supplier" do
    visit customer_supplier_url(@customer_supplier)
    click_on "Edit this customer supplier", match: :first

    fill_in "Air line", with: @customer_supplier.air_line
    fill_in "Current date", with: @customer_supplier.current_date
    fill_in "Customer", with: @customer_supplier.customer
    fill_in "Deal", with: @customer_supplier.deal
    fill_in "Passenger name", with: @customer_supplier.passenger_name
    fill_in "Purchase", with: @customer_supplier.purchase
    fill_in "Ref date", with: @customer_supplier.ref_date
    fill_in "Reservation num", with: @customer_supplier.reservation_num
    fill_in "Reservation type", with: @customer_supplier.reservation_type
    fill_in "Sale", with: @customer_supplier.sale
    fill_in "Sector", with: @customer_supplier.sector
    fill_in "Supplier", with: @customer_supplier.supplier
    fill_in "Travel date", with: @customer_supplier.travel_date
    click_on "Update Customer supplier"

    assert_text "Customer supplier was successfully updated"
    click_on "Back"
  end

  test "should destroy Customer supplier" do
    visit customer_supplier_url(@customer_supplier)
    click_on "Destroy this customer supplier", match: :first

    assert_text "Customer supplier was successfully destroyed"
  end
end
