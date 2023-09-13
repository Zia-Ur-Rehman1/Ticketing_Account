# app/services/csv_exporter.rb
require 'csv'

class CsvExporter
  def initialize(records)
    @records = records
  end

  def to_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_headers

      @records.each do |record|
        csv << csv_row(record)
      end
    end
  end

  private

  def csv_headers
    csv_headers= ["Sector", "Passenger Name", "Reservation Num", "Supplier", "Air_line", "Travel_date", "Deal", "Sale", "Purchase", "Customer", "Date"]
  end

  def csv_row(record)
    [
      record.sector,
      record.passenger_name,
      record.reservation_num,
      record.supplier,
      record.air_line,
      record.travel_date,
      record.deal,
      record.sale,
      record.purchase,
      record.customer,
      record.created_at,
    ]
  end
end
