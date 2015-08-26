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

ActiveRecord::Schema.define(version: 20150826010154) do

  create_table "feeds", force: :cascade do |t|
    t.string   "title"
    t.text     "summary"
    t.string   "url"
    t.datetime "published_at"
    t.string   "guid"
  end

  create_table "items", force: :cascade do |t|
    t.integer "portfolio_id"
    t.integer "stock_id"
  end

  add_index "items", ["portfolio_id"], name: "index_items_on_portfolio_id"
  add_index "items", ["stock_id"], name: "index_items_on_stock_id"

  create_table "portfolios", force: :cascade do |t|
    t.string  "title"
    t.integer "user_id"
  end

  add_index "portfolios", ["user_id"], name: "index_portfolios_on_user_id"

  create_table "stocks", force: :cascade do |t|
    t.string "company_name"
    t.string "ticker"
    t.float  "quote"
    t.float  "price_change"
    t.float  "percentage_change"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "admin",                  default: false
    t.string   "password_digest"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
