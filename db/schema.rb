# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2016_10_22_204930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rates", id: :serial, force: :cascade do |t|
    t.string "from_iso_code", null: false
    t.string "to_iso_code", null: false
    t.float "rate", null: false
    t.datetime "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_iso_code", "to_iso_code"], name: "index_rates_on_from_iso_code_and_to_iso_code", unique: true
    t.index ["from_iso_code"], name: "index_rates_on_from_iso_code"
  end

end
