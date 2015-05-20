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

ActiveRecord::Schema.define(version: 20150520051942) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "customer_id",         limit: 4,                   null: false
    t.boolean  "primary",             limit: 1,   default: false
    t.string   "street_address",      limit: 255,                 null: false
    t.string   "extended_address",    limit: 255
    t.string   "locality",            limit: 255,                 null: false
    t.string   "region",              limit: 255
    t.string   "postal_code",         limit: 255
    t.string   "country_code_alpha2", limit: 255,                 null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer  "customer_id",     limit: 4,   null: false
    t.integer  "last_four",       limit: 4,   null: false
    t.string   "braintree_token", limit: 255, null: false
    t.integer  "bin",             limit: 4,   null: false
    t.string   "card_type",       limit: 255, null: false
    t.string   "expiration_date", limit: 255, null: false
    t.string   "image_url",       limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",            limit: 255, null: false
    t.string   "last_name",             limit: 255, null: false
    t.string   "email",                 limit: 255, null: false
    t.string   "braintree_customer_id", limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id",              limit: 4,   null: false
    t.integer  "product_id",               limit: 4,   null: false
    t.integer  "address_id",               limit: 4,   null: false
    t.integer  "quantity",                 limit: 4,   null: false
    t.string   "braintree_transaction_id", limit: 255, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "products", force: :cascade do |t|
    t.decimal  "price",      precision: 5, scale: 2, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
