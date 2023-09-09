
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
num_records = 100 
num_records.times do
  CustomerSupplier.create(
    air_line: Faker::Company.name,
    passenger_name: Faker::Name.name,
    reservation_num: Faker::Number.unique.number(digits: 6),
    reservation_type: Faker::Lorem.word,
    supplier: Faker::Company.name,
    air_line: Faker::Company.name,
    travel_date: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
    created_at: Faker::Date.between(from: 2.years.ago, to: 1.year.ago),
    ref_date: Faker::Date.between(from: 2.years.ago, to: 1.year.ago),
    deal: Faker::Commerce.price(range: 100..1000.0, as_string: true),
    sale: Faker::Commerce.price(range: 100..1000.0, as_string: true),
    purchase: Faker::Commerce.price(range: 50..800.0, as_string: true),
    customer: Faker::Company.name,
    sector: Faker::Address.city
  )
end