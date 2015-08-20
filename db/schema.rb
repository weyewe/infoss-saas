# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150811055610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft",                                                        null: false
    t.integer  "rgt",                                                        null: false
    t.decimal  "amount",            precision: 14, scale: 2, default: 0.0
    t.boolean  "is_contra_account",                          default: false
    t.integer  "depth"
    t.integer  "normal_balance",                             default: 1
    t.integer  "account_case",                               default: 2
    t.boolean  "is_base_account",                            default: false
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "action_assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "action_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actions", force: true do |t|
    t.integer  "section_id"
    t.string   "name"
    t.string   "action_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "airlines", force: true do |t|
    t.string   "name"
    t.string   "abbrevation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "airports", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "abbrevation"
    t.integer  "city_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bill_of_ladings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blending_work_orders", force: true do |t|
    t.string   "code"
    t.integer  "blending_recipe_id"
    t.text     "description"
    t.datetime "blending_date"
    t.integer  "warehouse_id"
    t.boolean  "is_confirmed",       default: false
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_adjustments", force: true do |t|
    t.integer  "cash_bank_id"
    t.decimal  "amount",               precision: 14, scale: 2,  default: 0.0
    t.decimal  "exchange_rate_amount", precision: 18, scale: 11, default: 0.0
    t.integer  "exchange_rate_id"
    t.integer  "status",                                         default: 1
    t.datetime "adjustment_date"
    t.datetime "confirmed_at"
    t.boolean  "is_confirmed",                                   default: false
    t.text     "description"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_bank_mutations", force: true do |t|
    t.integer  "target_cash_bank_id"
    t.integer  "source_cash_bank_id"
    t.decimal  "amount",               precision: 14, scale: 2,  default: 0.0
    t.datetime "mutation_date"
    t.boolean  "is_confirmed",                                   default: false
    t.text     "description"
    t.datetime "confirmed_at"
    t.string   "no_bukti"
    t.integer  "exchange_rate_id"
    t.decimal  "exchange_rate_amount", precision: 18, scale: 11, default: 0.0
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_banks", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "exchange_id"
    t.text     "description"
    t.boolean  "is_bank",                              default: true
    t.decimal  "amount",      precision: 14, scale: 2, default: 0.0
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_mutations", force: true do |t|
    t.string   "source_class"
    t.integer  "source_id"
    t.string   "source_code"
    t.decimal  "amount",        precision: 14, scale: 2, default: 0.0
    t.integer  "status",                                 default: 1
    t.datetime "mutation_date"
    t.integer  "cash_bank_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "city_locations", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "abbrevation"
    t.integer  "country_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "closing_details", force: true do |t|
    t.integer  "closing_id"
    t.integer  "exchange_id"
    t.decimal  "rate",        precision: 18, scale: 11, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "closings", force: true do |t|
    t.integer  "period"
    t.integer  "year_period"
    t.datetime "beginning_period"
    t.datetime "end_date_period"
    t.boolean  "is_year_closing",  default: false
    t.boolean  "is_closed",        default: false
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "code"
    t.string   "name"
    t.integer  "company_id"
    t.integer  "status",               default: 1
    t.text     "address"
    t.string   "contact_person"
    t.string   "postal_code"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "npwp"
    t.string   "nppkp"
    t.integer  "city_location_id"
    t.integer  "port_id"
    t.integer  "airport_id"
    t.integer  "credit_terms_in_days"
    t.integer  "credit_terms_in_idr"
    t.string   "shipment_status",      default: "1"
    t.integer  "last_shipment_date"
    t.boolean  "is_agent",             default: false
    t.string   "agent_code"
    t.boolean  "is_shipper",           default: false
    t.string   "shipper_code"
    t.boolean  "is_consignee",         default: false
    t.string   "consignee_code"
    t.boolean  "is_iata",              default: false
    t.string   "iata_code"
    t.boolean  "is_ssline",            default: false
    t.string   "ssline_code"
    t.boolean  "is_depo",              default: false
    t.string   "depo_code"
    t.boolean  "is_emkl",              default: false
    t.string   "emkl_code",            default: "f"
    t.string   "master_code",          default: "f"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "continents", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "abbrevation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "costs", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.decimal  "amount",         precision: 14, scale: 2, default: 0.0
    t.decimal  "cbm",            precision: 14, scale: 2, default: 0.0
    t.decimal  "min_charge_idr", precision: 14, scale: 2, default: 0.0
    t.decimal  "min_charge_usd", precision: 14, scale: 2, default: 0.0
    t.decimal  "max_charge_idr", precision: 14, scale: 2, default: 0.0
    t.decimal  "max_charge_usd", precision: 14, scale: 2, default: 0.0
    t.integer  "cost_type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "country_locations", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "abbrevation"
    t.integer  "continent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_orders", force: true do |t|
    t.integer  "shipment_order_id"
    t.text     "to_name"
    t.text     "attention"
    t.text     "commodity"
    t.text     "remarks"
    t.integer  "printing"
    t.datetime "printed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "contact_no"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "epl_detail_demurrage_container_details", force: true do |t|
    t.integer  "epl_detail_demurrage_container_id"
    t.integer  "company_id"
    t.integer  "day_container"
    t.text     "description"
    t.decimal  "amount_container_20",               precision: 14, scale: 2, default: 0.0
    t.decimal  "amount_container_40",               precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "epl_detail_demurrage_containers", force: true do |t|
    t.integer  "epl_detail_demurrage_id"
    t.integer  "company_id"
    t.string   "container_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "epl_detail_demurrages", force: true do |t|
    t.integer  "epl_detail_id"
    t.integer  "company_id"
    t.integer  "customer_id"
    t.integer  "customer_type_id"
    t.datetime "date_back_container"
    t.integer  "free_time"
    t.integer  "fase"
    t.integer  "total_container_20"
    t.integer  "total_container_40"
    t.string   "disc_type"
    t.decimal  "disc_amount",         precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "epl_detail_handlings", force: true do |t|
    t.integer  "epl_detail_id"
    t.integer  "company_id"
    t.integer  "customer_id"
    t.integer  "customer_type_id"
    t.integer  "sequence"
    t.decimal  "feet_20",          precision: 14, scale: 2, default: 0.0
    t.decimal  "feet_40",          precision: 14, scale: 2, default: 0.0
    t.decimal  "feet_hq",          precision: 14, scale: 2, default: 0.0
    t.decimal  "feet_m3",          precision: 14, scale: 2, default: 0.0
    t.decimal  "rate_20",          precision: 14, scale: 2, default: 0.0
    t.decimal  "rate_40",          precision: 14, scale: 2, default: 0.0
    t.decimal  "rate_hq",          precision: 14, scale: 2, default: 0.0
    t.decimal  "rate_m3",          precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "epl_detail_profit_shares", force: true do |t|
    t.integer  "epl_detail_id"
    t.integer  "company_id"
    t.integer  "customer_id"
    t.integer  "customer_type_id"
    t.integer  "sequence"
    t.decimal  "s_feet_20",        precision: 14, scale: 2, default: 0.0
    t.decimal  "s_feet_40",        precision: 14, scale: 2, default: 0.0
    t.decimal  "s_feet_hq",        precision: 14, scale: 2, default: 0.0
    t.decimal  "s_feet_m3",        precision: 14, scale: 2, default: 0.0
    t.decimal  "s_rate_20",        precision: 14, scale: 2, default: 0.0
    t.decimal  "s_rate_40",        precision: 14, scale: 2, default: 0.0
    t.decimal  "s_rate_hq",        precision: 14, scale: 2, default: 0.0
    t.decimal  "s_rate_m3",        precision: 14, scale: 2, default: 0.0
    t.decimal  "b_feet_20",        precision: 14, scale: 2, default: 0.0
    t.decimal  "b_feet_40",        precision: 14, scale: 2, default: 0.0
    t.decimal  "b_feet_hq",        precision: 14, scale: 2, default: 0.0
    t.decimal  "b_feet_m3",        precision: 14, scale: 2, default: 0.0
    t.decimal  "b_rate_20",        precision: 14, scale: 2, default: 0.0
    t.decimal  "b_rate_40",        precision: 14, scale: 2, default: 0.0
    t.decimal  "b_rate_hq",        precision: 14, scale: 2, default: 0.0
    t.decimal  "b_rate_m3",        precision: 14, scale: 2, default: 0.0
    t.decimal  "percentage",       precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "epl_details", force: true do |t|
    t.integer  "epl_id"
    t.integer  "company_id"
    t.integer  "sequence"
    t.boolean  "is_income"
    t.integer  "customer_id"
    t.integer  "customer_type_id"
    t.integer  "account_id"
    t.text     "description"
    t.boolean  "coding_quantity"
    t.integer  "type"
    t.decimal  "quantity",         precision: 14, scale: 2, default: 0.0
    t.decimal  "per_qty",          precision: 14, scale: 2, default: 0.0
    t.integer  "amount_crr"
    t.decimal  "amount_usd",       precision: 14, scale: 2, default: 0.0
    t.decimal  "amount_idr",       precision: 14, scale: 2, default: 0.0
    t.boolean  "sign"
    t.boolean  "data_from"
    t.integer  "memo_no"
    t.boolean  "status_memo"
    t.datetime "created_memo_on"
    t.boolean  "paid_pr"
    t.boolean  "is_split_in_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "epls", force: true do |t|
    t.integer  "epl_no"
    t.integer  "shipment_order_id"
    t.integer  "company_id"
    t.decimal  "rate",              precision: 14, scale: 2, default: 0.0
    t.datetime "ex_rate_date"
    t.decimal  "est_usd_ship_cons", precision: 14, scale: 2, default: 0.0
    t.decimal  "est_idr_ship_cons", precision: 14, scale: 2, default: 0.0
    t.decimal  "est_usd_agent",     precision: 14, scale: 2, default: 0.0
    t.decimal  "est_idr_agent",     precision: 14, scale: 2, default: 0.0
    t.integer  "time_close_epl"
    t.integer  "close_epl_on"
    t.integer  "period"
    t.integer  "year_period"
    t.integer  "printing"
    t.datetime "printed_on"
    t.integer  "ex_rate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exchange_rates", force: true do |t|
    t.integer  "exchange_id"
    t.datetime "ex_rate_date"
    t.decimal  "rate",         precision: 18, scale: 11, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exchanges", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "account_payable_id"
    t.integer  "account_receivable_id"
    t.integer  "gbch_payable_id"
    t.integer  "gbch_receivable_id"
    t.boolean  "is_base",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memorial_details", force: true do |t|
    t.integer  "memorial_id"
    t.integer  "account_id"
    t.string   "code"
    t.integer  "status"
    t.decimal  "amount",      precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memorials", force: true do |t|
    t.string   "code"
    t.string   "no_bukti"
    t.decimal  "amount",       precision: 14, scale: 2, default: 0.0
    t.string   "description"
    t.boolean  "is_confirmed",                          default: false
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payables", force: true do |t|
    t.string   "source_class"
    t.integer  "source_id"
    t.string   "source_code"
    t.integer  "contact_id"
    t.decimal  "amount",                   precision: 14, scale: 2,  default: 0.0
    t.decimal  "remaining_amount",         precision: 14, scale: 2,  default: 0.0
    t.integer  "exchange_id"
    t.decimal  "exchange_rate_amount",     precision: 18, scale: 11, default: 0.0
    t.datetime "due_date"
    t.decimal  "pending_clearence_amount", precision: 14, scale: 2,  default: 0.0
    t.boolean  "is_completed",                                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_request_details", force: true do |t|
    t.integer  "payment_request_id"
    t.integer  "account_id"
    t.integer  "status",                                      default: 1
    t.decimal  "amount",             precision: 14, scale: 2, default: 0.0
    t.boolean  "is_legacy",                                   default: false
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_requests", force: true do |t|
    t.integer  "contact_id"
    t.string   "no_bukti"
    t.datetime "request_date"
    t.string   "code"
    t.integer  "account_id"
    t.integer  "exchange_id"
    t.text     "description"
    t.decimal  "amount",               precision: 14, scale: 2,  default: 0.0
    t.decimal  "exchange_rate_amount", precision: 18, scale: 11, default: 0.0
    t.datetime "due_date"
    t.integer  "exchange_rate_id"
    t.boolean  "is_confirmed",                                   default: false
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_voucher_details", force: true do |t|
    t.integer  "payment_voucher_id"
    t.decimal  "amount",             precision: 14, scale: 2,  default: 0.0
    t.decimal  "amount_paid",        precision: 14, scale: 2,  default: 0.0
    t.decimal  "pph_21",             precision: 14, scale: 2,  default: 0.0
    t.decimal  "pph_23",             precision: 14, scale: 2,  default: 0.0
    t.integer  "payable_id"
    t.decimal  "rate",               precision: 18, scale: 11, default: 0.0
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_vouchers", force: true do |t|
    t.string   "code"
    t.integer  "contact_id"
    t.integer  "cash_bank_id"
    t.integer  "status_pembulatan"
    t.datetime "payment_date"
    t.decimal  "amount",              precision: 14, scale: 2,  default: 0.0
    t.decimal  "rate_to_idr",         precision: 18, scale: 11, default: 0.0
    t.decimal  "total_pph_23",        precision: 18, scale: 11, default: 0.0
    t.decimal  "total_pph_21",        precision: 18, scale: 11, default: 0.0
    t.decimal  "biaya_bank",          precision: 18, scale: 11, default: 0.0
    t.decimal  "pembulatan",          precision: 18, scale: 11, default: 0.0
    t.string   "no_bukti"
    t.string   "gbch_no"
    t.boolean  "is_gbch",                                       default: false
    t.boolean  "is_reconciled",                                 default: false
    t.datetime "reconciliation_date"
    t.datetime "due_date"
    t.boolean  "is_confirmed",                                  default: false
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ports", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "abbrevation"
    t.integer  "city_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_down_payment_allocation_details", force: true do |t|
    t.integer  "purchase_down_payment_allocation_id"
    t.integer  "payable_id"
    t.string   "code"
    t.decimal  "amount",                              precision: 14, scale: 2,  default: 0.0
    t.decimal  "amount_paid",                         precision: 14, scale: 2,  default: 0.0
    t.decimal  "rate",                                precision: 18, scale: 11, default: 0.0
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_down_payment_allocations", force: true do |t|
    t.integer  "contact_id"
    t.integer  "receivable_id"
    t.string   "code"
    t.datetime "allocation_date"
    t.decimal  "total_amount",    precision: 14, scale: 2,  default: 0.0
    t.decimal  "rate_to_idr",     precision: 18, scale: 11, default: 0.0
    t.boolean  "is_confirmed",                              default: false
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_down_payments", force: true do |t|
    t.integer  "contact_id"
    t.integer  "receivable_id"
    t.integer  "payable_id"
    t.string   "code"
    t.datetime "down_payment_date"
    t.datetime "due_date"
    t.integer  "exchange_id"
    t.integer  "exchange_rate_id"
    t.decimal  "exchange_rate_amount", precision: 14, scale: 2, default: 0.0
    t.decimal  "total_amount",         precision: 14, scale: 2, default: 0.0
    t.boolean  "is_confirmed",                                  default: false
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_invoice_details", force: true do |t|
    t.integer  "purchase_invoice_id"
    t.integer  "purchase_receival_detail_id"
    t.string   "code"
    t.decimal  "amount",                      precision: 14, scale: 2, default: 0.0
    t.decimal  "price",                       precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_invoice_migrations", force: true do |t|
    t.string   "nomor_surat"
    t.integer  "contact_id"
    t.integer  "exchange_id"
    t.decimal  "exchange_rate_amount", precision: 18, scale: 11, default: 0.0
    t.decimal  "amount_payable",       precision: 14, scale: 2,  default: 0.0
    t.decimal  "tax",                  precision: 14, scale: 2,  default: 0.0
    t.decimal  "dpp",                  precision: 14, scale: 2,  default: 0.0
    t.datetime "invoice_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_invoices", force: true do |t|
    t.integer  "purchase_receival_id"
    t.string   "description"
    t.string   "code"
    t.string   "nomor_surat"
    t.integer  "exchange_id"
    t.decimal  "exchange_rate_amount", precision: 18, scale: 11, default: 0.0
    t.integer  "exchange_rate_id"
    t.decimal  "amount_payable",       precision: 14, scale: 2,  default: 0.0
    t.decimal  "discount",             precision: 14, scale: 2,  default: 0.0
    t.decimal  "tax",                  precision: 14, scale: 2,  default: 0.0
    t.boolean  "is_taxable",                                     default: false
    t.boolean  "is_confirmed",                                   default: false
    t.datetime "confirmed_at"
    t.datetime "invoice_date"
    t.datetime "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_order_details", force: true do |t|
    t.string   "code"
    t.integer  "purchase_order_id"
    t.integer  "item_id"
    t.decimal  "amount",                  precision: 14, scale: 2, default: 0.0
    t.decimal  "price",                   precision: 14, scale: 2, default: 0.0
    t.boolean  "is_all_received",                                  default: false
    t.decimal  "pending_receival_amount", precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_orders", force: true do |t|
    t.string   "code"
    t.integer  "contact_id"
    t.datetime "purchase_date"
    t.string   "nomor_surat"
    t.integer  "exchange_id"
    t.boolean  "is_receival_completed", default: false
    t.text     "description"
    t.boolean  "allow_edit_detail",     default: false
    t.boolean  "is_confirmed",          default: false
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_receival_details", force: true do |t|
    t.string   "code"
    t.integer  "purchase_receival_id"
    t.integer  "purchase_order_detail_id"
    t.integer  "item_id"
    t.decimal  "amount",                   precision: 14, scale: 2, default: 0.0
    t.decimal  "pending_invoiced_amount",  precision: 14, scale: 2, default: 0.0
    t.boolean  "is_all_invoiced",                                   default: false
    t.decimal  "cogs",                     precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_receivals", force: true do |t|
    t.string   "code"
    t.integer  "purchase_order_id"
    t.datetime "receival_date"
    t.integer  "warehouse_id"
    t.string   "nomor_surat"
    t.integer  "exchange_rate_id"
    t.decimal  "exchange_rate_amount", precision: 18, scale: 11, default: 0.0
    t.decimal  "total_cogs",           precision: 14, scale: 2,  default: 0.0
    t.decimal  "total_amount",         precision: 14, scale: 2,  default: 0.0
    t.boolean  "is_confirmed",                                   default: false
    t.datetime "confirmed_at"
    t.boolean  "is_invoice_completed",                           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receipt_voucher_details", force: true do |t|
    t.integer  "receipt_voucher_id"
    t.decimal  "amount",             precision: 14, scale: 2,  default: 0.0
    t.decimal  "amount_paid",        precision: 14, scale: 2,  default: 0.0
    t.decimal  "pph_23",             precision: 14, scale: 2,  default: 0.0
    t.integer  "receivable_id"
    t.decimal  "rate",               precision: 18, scale: 11, default: 0.0
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receipt_vouchers", force: true do |t|
    t.string   "code"
    t.integer  "contact_id"
    t.integer  "cash_bank_id"
    t.integer  "status_pembulatan"
    t.datetime "receipt_date"
    t.decimal  "amount",              precision: 14, scale: 2,  default: 0.0
    t.decimal  "rate_to_idr",         precision: 18, scale: 11, default: 0.0
    t.decimal  "total_pph_23",        precision: 18, scale: 11, default: 0.0
    t.decimal  "biaya_bank",          precision: 18, scale: 11, default: 0.0
    t.decimal  "pembulatan",          precision: 18, scale: 11, default: 0.0
    t.string   "no_bukti"
    t.string   "gbch_no"
    t.boolean  "is_gbch",                                       default: false
    t.boolean  "is_reconciled",                                 default: false
    t.datetime "reconciliation_date"
    t.datetime "due_date"
    t.boolean  "is_confirmed",                                  default: false
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receivables", force: true do |t|
    t.string   "source_class"
    t.integer  "source_id"
    t.string   "source_code"
    t.integer  "contact_id"
    t.decimal  "amount",                   precision: 14, scale: 2,  default: 0.0
    t.decimal  "remaining_amount",         precision: 14, scale: 2,  default: 0.0
    t.integer  "exchange_id"
    t.decimal  "exchange_rate_amount",     precision: 18, scale: 11, default: 0.0
    t.datetime "due_date"
    t.decimal  "pending_clearence_amount", precision: 14, scale: 2,  default: 0.0
    t.boolean  "is_completed",                                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.json     "the_role",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_invoice_details", force: true do |t|
    t.integer  "sales_invoice_id"
    t.integer  "delivery_order_detail_id"
    t.string   "code"
    t.decimal  "amount",                   precision: 14, scale: 2, default: 0.0
    t.decimal  "price",                    precision: 14, scale: 2, default: 0.0
    t.decimal  "cos",                      precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_invoices", force: true do |t|
    t.integer  "delivery_order_id"
    t.text     "description"
    t.string   "code"
    t.string   "nomor_surat"
    t.integer  "exchange_id"
    t.integer  "exchange_rate_id"
    t.decimal  "exchange_rate_amount", precision: 18, scale: 11, default: 0.0
    t.decimal  "total_cos",            precision: 14, scale: 2,  default: 0.0
    t.decimal  "amount_receivable",    precision: 14, scale: 2,  default: 0.0
    t.decimal  "discount",             precision: 14, scale: 2,  default: 0.0
    t.decimal  "dpp",                  precision: 14, scale: 2,  default: 0.0
    t.decimal  "tax",                  precision: 14, scale: 2,  default: 0.0
    t.boolean  "is_confirmed",                                   default: false
    t.datetime "confirmed_at"
    t.datetime "invoice_date"
    t.datetime "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sea_containers", force: true do |t|
    t.integer  "shipment_order_id"
    t.integer  "company_id"
    t.string   "container_no"
    t.string   "seal_no"
    t.integer  "size"
    t.integer  "type"
    t.decimal  "gross_weight",      precision: 14, scale: 2, default: 0.0
    t.decimal  "net_weight",        precision: 14, scale: 2, default: 0.0
    t.decimal  "cbm",               precision: 14, scale: 2, default: 0.0
    t.boolean  "part_of",                                    default: false
    t.text     "commodity"
    t.decimal  "no_of_pieces",      precision: 14, scale: 2, default: 0.0
    t.string   "packaging_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "name"
    t.string   "controller_name"
    t.text     "description"
    t.integer  "position"
    t.string   "group_name"
    t.string   "tab"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipment_advices", force: true do |t|
    t.integer  "shipment_order_id"
    t.integer  "company_id"
    t.string   "reference"
    t.string   "remarks"
    t.integer  "print_to_agent"
    t.datetime "print_to_agent_on"
    t.integer  "print_to_delivery"
    t.datetime "print_to_delivery_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipment_instructions", force: true do |t|
    t.integer  "shipment_order_id"
    t.integer  "company_id"
    t.string   "si_reference"
    t.string   "attention"
    t.integer  "shipper_id"
    t.string   "shipper_name"
    t.text     "shipper_address"
    t.integer  "consignee_id"
    t.string   "consignee_name"
    t.text     "consignee_address"
    t.integer  "n_party_id"
    t.string   "n_party_name"
    t.text     "n_party_address"
    t.text     "good_description"
    t.integer  "updated"
    t.text     "special_instruction"
    t.string   "original_bl"
    t.string   "freight_agreed"
    t.integer  "collect_at"
    t.string   "collect_name"
    t.text     "collect_address"
    t.integer  "printing"
    t.integer  "printed_on"
    t.string   "pieces_rcp"
    t.decimal  "gross_weight",         precision: 14, scale: 2, default: 0.0
    t.string   "kglb"
    t.decimal  "charge_weight",        precision: 14, scale: 2, default: 0.0
    t.decimal  "charge_rate",          precision: 14, scale: 2, default: 0.0
    t.string   "total"
    t.string   "good_nature_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipment_order_routings", force: true do |t|
    t.integer  "shipment_order_id"
    t.integer  "company_id"
    t.integer  "vessel_id"
    t.string   "vessel_name"
    t.string   "voyage"
    t.integer  "city_location_id"
    t.integer  "port_id"
    t.integer  "flight_id"
    t.string   "flight_no"
    t.integer  "airport_from_id"
    t.integer  "airport_to_id"
    t.datetime "etd"
    t.string   "vessel_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipment_order_services", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipment_orders", force: true do |t|
    t.string   "shipment_no"
    t.integer  "job_number"
    t.integer  "sub_job_number"
    t.integer  "job_id"
    t.integer  "job_owner_id"
    t.integer  "total_sub"
    t.string   "si_reference"
    t.datetime "si_date"
    t.string   "load_status"
    t.string   "container_status"
    t.string   "freight_status"
    t.integer  "service_no_id"
    t.integer  "market_id"
    t.integer  "market_company_id"
    t.string   "job_status"
    t.datetime "goods_rec_date"
    t.string   "conversion"
    t.string   "quotaion_no"
    t.integer  "agent_id"
    t.string   "agent_name"
    t.string   "agent_address"
    t.integer  "delivery_id"
    t.string   "delivery_name"
    t.string   "delivery_address"
    t.integer  "transhipment_id"
    t.string   "transhipment_name"
    t.string   "transhipment_address"
    t.integer  "shipper_id"
    t.string   "shipper_name"
    t.string   "shipper_address"
    t.integer  "consignee_id"
    t.string   "consignee_name"
    t.string   "consignee_address"
    t.integer  "nparty_id"
    t.string   "nparty_name"
    t.string   "nparty_address"
    t.string   "receipt_place_code"
    t.string   "receipt_place_name"
    t.string   "loading_port_code"
    t.string   "loading_port_name"
    t.string   "discharge_port_code"
    t.string   "discharge_port_name"
    t.string   "delivery_place_code"
    t.string   "delivery_place_name"
    t.string   "departure_air_code"
    t.string   "departure_air_name"
    t.text     "good_description"
    t.string   "pieces_rcp"
    t.decimal  "gross_weight",         precision: 14, scale: 2, default: 0.0
    t.string   "kglb"
    t.decimal  "charge_weight",        precision: 14, scale: 2, default: 0.0
    t.decimal  "charge_rate",          precision: 14, scale: 2, default: 0.0
    t.string   "total"
    t.string   "commodity"
    t.string   "packaging_code"
    t.string   "good_nature_quantity"
    t.string   "shipmark"
    t.string   "chargeable_weight"
    t.decimal  "weight_hawb",          precision: 14, scale: 2, default: 0.0
    t.string   "carriage_value"
    t.string   "custome_value"
    t.datetime "etd"
    t.datetime "eta"
    t.string   "obl_status"
    t.integer  "obl_collect_id"
    t.integer  "obl_payable_id"
    t.decimal  "obl_amount",           precision: 14, scale: 2, default: 0.0
    t.string   "obl_currency"
    t.string   "hbl_status"
    t.integer  "hbl_collect_id"
    t.integer  "hbl_payable_id"
    t.string   "hbl_currency"
    t.decimal  "hbl_amount",           precision: 14, scale: 2, default: 0.0
    t.string   "mawb_status"
    t.integer  "mawb_collect_id"
    t.integer  "mawb_payable_id"
    t.string   "mawb_currency"
    t.decimal  "mawb_rate",            precision: 14, scale: 2, default: 0.0
    t.string   "hawb_status"
    t.integer  "hawb_collect_id"
    t.integer  "hawb_payable_id"
    t.string   "hawb_currency"
    t.decimal  "hawb_rate",            precision: 14, scale: 2, default: 0.0
    t.string   "currency"
    t.string   "handling_info"
    t.string   "hawb_no"
    t.string   "mawb_no"
    t.string   "ocean_mstbl_no"
    t.string   "house_bl_no"
    t.string   "second_bl_no"
    t.decimal  "volume_bl",            precision: 14, scale: 2, default: 0.0
    t.decimal  "volume_invoice",       precision: 14, scale: 2, default: 0.0
    t.string   "warehouse_name"
    t.string   "kins"
    t.string   "cf_name"
    t.integer  "ssline_id"
    t.integer  "iata_id"
    t.integer  "broker_id"
    t.integer  "depo_id"
    t.string   "vessel_flight"
    t.string   "truck"
    t.boolean  "job_closed",                                    default: false
    t.datetime "job_closed_on"
  end

  create_table "telex_releases", force: true do |t|
    t.integer  "shipment_order_id"
    t.integer  "company_id"
    t.string   "original"
    t.string   "sea_way_bill"
    t.integer  "printing"
    t.datetime "printed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_data", force: true do |t|
    t.integer  "transaction_source_id"
    t.string   "transaction_source_type"
    t.datetime "transaction_datetime"
    t.text     "description"
    t.decimal  "amount",                  precision: 14, scale: 2, default: 0.0
    t.boolean  "is_confirmed"
    t.integer  "code"
    t.boolean  "is_contra_transaction",                            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_data_details", force: true do |t|
    t.integer  "transaction_data_id"
    t.integer  "account_id"
    t.integer  "entry_case"
    t.decimal  "amount",              precision: 14, scale: 2, default: 0.0
    t.string   "description"
    t.boolean  "is_bank_transaction",                          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_data_non_base_exchange_details", force: true do |t|
    t.integer  "transaction_data_detail_id"
    t.integer  "exchange_id"
    t.decimal  "amount",                     precision: 18, scale: 11, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role_id"
    t.string   "name"
    t.string   "username"
    t.string   "login"
    t.boolean  "is_deleted",             default: false
    t.boolean  "is_main_user",           default: false
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "valid_comb_income_statements", force: true do |t|
    t.integer  "account_id"
    t.integer  "closing_id"
    t.decimal  "amount",     precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "valid_comb_non_base_exchanges", force: true do |t|
    t.integer  "valid_comb_id"
    t.integer  "exchange_id"
    t.decimal  "amount",        precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "valid_combs", force: true do |t|
    t.integer  "account_id"
    t.integer  "closing_id"
    t.integer  "entry_case"
    t.decimal  "amount",     precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vats", force: true do |t|
    t.string   "name"
    t.decimal  "value",      precision: 14, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vessels", force: true do |t|
    t.string   "name"
    t.string   "abbrevation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
