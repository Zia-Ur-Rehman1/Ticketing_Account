# app/services/xlsx_importer.rb
require 'roo'

class XlsxImporter
  def initialize(file_path)
    @file_path = file_path
  end

  def import
    xlsx = Roo::Excelx.new(@file_path)
    worksheet = xlsx.sheet(0)
    (5..worksheet.last_row).each do |row_num|
      record = CustomerSupplier.new
      map_row_to_record(worksheet, row_num, record)
      record.save
    end
  end

  private

  def map_row_to_record(worksheet, row_num, record)
    record.created_at = worksheet.cell(row_num, 1)
    record.passenger_name = worksheet.cell(row_num, 2)
    record.sector = worksheet.cell(row_num, 3)
    record.reservation_num = worksheet.cell(row_num, 4)
    record.supplier = worksheet.cell(row_num, 5)
    record.customer = worksheet.cell(row_num, 6)
    record.air_line = worksheet.cell(row_num, 7)
    record.travel_date = parse_date(worksheet.cell(row_num, 8))
    record.deal = worksheet.cell(row_num, 9)
    record.sale = worksheet.cell(row_num, 10)
    record.purchase = worksheet.cell(row_num, 11)
  end

  def parse_date(date_string)
    begin
      parsed_date = Date.parse(date_string)
    rescue ArgumentError, TypeError
      parsed_date = nil # Set to nil if not a valid date format
    end

    parsed_date
  end
end
