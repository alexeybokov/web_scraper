# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_06_123059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ilearn_districts", force: :cascade do |t|
    t.bigint "district_number"
    t.string "district_name"
    t.string "superintendent"
    t.string "address"
    t.string "phone"
    t.string "district_type"
    t.string "data_source_url"
    t.string "scrape_dev"
  end

  create_table "ilearn_expenditures_disbursements", force: :cascade do |t|
    t.bigint "district_number"
    t.string "district_name"
    t.integer "instruction_amount"
    t.integer "general_administration_amount"
    t.integer "suppert_services_amount"
    t.integer "other_amount"
    t.integer "total_amount"
    t.string "data_source_url"
    t.string "scrape_dev"
    t.bigint "ilearn_districts_id"
    t.index ["ilearn_districts_id"], name: "index_ilearn_expenditures_disbursements_on_ilearn_districts_id"
  end

  create_table "ilearn_tax_information", force: :cascade do |t|
    t.bigint "district_number"
    t.string "district_name"
    t.bigint "real_eav"
    t.bigint "real_per_pupil"
    t.integer "statewide_eavpp_rank"
    t.string "formula_type"
    t.integer "total_tax_rate"
    t.integer "statewide_ttr_rank"
    t.integer "operating_tax_rate"
    t.bigint "statewide_otr_rank"
  end

  create_table "ilern_student_info", force: :cascade do |t|
    t.bigint "district_number"
    t.string "district_name"
    t.integer "9-Month Avg. Daily Attendance"
    t.integer "Statewide ADA"
    t.integer "Net Operating Expanse"
    t.integer "Operating Expance Per Pupil (OEPP)"
    t.integer "Statewide OEPP Rank"
    t.integer "Statewide OEPP"
    t.integer "Allowance for Tuition Computation"
    t.integer "Per Capita Tuition Charge (PCTC)"
    t.integer "Statewide PCTC Rank"
    t.integer "Statewide PCTC"
    t.string "data_source_url"
    t.string "scrape_dev"
    t.bigint "ilearn_districts_id"
    t.index ["ilearn_districts_id"], name: "index_ilern_student_info_on_ilearn_districts_id"
  end

  create_table "receipts_revenues", force: :cascade do |t|
    t.bigint "district_number"
    t.string "district_name"
    t.bigint "state_amount"
    t.bigint "local_amount"
    t.bigint "federal_amount"
    t.bigint "total_amount"
    t.string "data_source_url"
    t.string "scrape_dev"
    t.bigint "ilearn_districts_id"
    t.index ["ilearn_districts_id"], name: "index_receipts_revenues_on_ilearn_districts_id"
  end

  add_foreign_key "ilearn_expenditures_disbursements", "ilearn_districts", column: "ilearn_districts_id"
  add_foreign_key "ilern_student_info", "ilearn_districts", column: "ilearn_districts_id"
  add_foreign_key "receipts_revenues", "ilearn_districts", column: "ilearn_districts_id"
end
