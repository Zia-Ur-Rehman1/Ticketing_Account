class CreateCustomerSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_suppliers do |t|
      t.string :sector
      t.string :passenger_name
      t.string :reservation_num
      t.integer :reservation_type
      t.string :supplier
      t.string :air_line
      t.datetime :travel_date
      t.datetime :current_date
      t.datetime :ref_date
      t.integer :deal
      t.integer :sale
      t.integer :purchase
      t.string :customer

      t.timestamps
    end
  end
end
