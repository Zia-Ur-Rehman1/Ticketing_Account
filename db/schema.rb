# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_18_211002) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer_suppliers", force: :cascade do |t|
    t.string "sector"
    t.string "passenger_name"
    t.string "reservation_num"
    t.integer "reservation_type"
    t.string "supplier"
    t.string "air_line"
    t.date "travel_date"
    t.date "current_date"
    t.date "ref_date"
    t.integer "deal"
    t.integer "sale"
    t.integer "purchase"
    t.string "customer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
