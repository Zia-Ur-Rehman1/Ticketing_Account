class CustomerSupplier < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    %w[
      air_line
      created_at
      current_date
      customer
      deal
      id
      passenger_name
      purchase
      ref_date
      reservation_num
      reservation_type
      sale
      sector
      supplier
      travel_date
      updated_at
    ]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
