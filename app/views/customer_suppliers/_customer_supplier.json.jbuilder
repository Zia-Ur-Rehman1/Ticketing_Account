json.extract! customer_supplier, :id, :sector, :passenger_name, :reservation_num, :reservation_type, :supplier, :air_line, :travel_date, :current_date, :ref_date, :deal, :sale, :purchase, :customer, :created_at, :updated_at
json.url customer_supplier_url(customer_supplier, format: :json)
