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

ActiveRecord::Schema.define(version: 20150303152050) do

  create_table "address_book_corps", force: :cascade do |t|
    t.string   "login",        limit: 255
    t.string   "fio",          limit: 255
    t.string   "email",        limit: 255
    t.string   "position",     limit: 255
    t.string   "department",   limit: 255
    t.string   "organisation", limit: 255
    t.string   "address",      limit: 255
    t.boolean  "have_phones",  limit: 1
    t.boolean  "have_email",   limit: 1
    t.boolean  "active",       limit: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "asterisk_logs", force: :cascade do |t|
    t.datetime "calldate"
    t.string   "clid",        limit: 80
    t.string   "src",         limit: 80
    t.string   "dst",         limit: 80
    t.string   "dcontext",    limit: 80
    t.string   "channel",     limit: 80
    t.string   "dstchannel",  limit: 80
    t.string   "lastapp",     limit: 80
    t.string   "lastdata",    limit: 80
    t.integer  "duration",    limit: 4
    t.integer  "billsec",     limit: 4
    t.string   "disposition", limit: 45
    t.integer  "amaflags",    limit: 4
    t.string   "accountcode", limit: 20
    t.string   "uniqueid",    limit: 32
    t.string   "userfield",   limit: 255
    t.boolean  "parsed",      limit: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "asterisk_time_logs", force: :cascade do |t|
    t.integer  "callid",         limit: 4
    t.string   "uniqueid",       limit: 32
    t.datetime "calltime_point"
    t.string   "context",        limit: 32
    t.string   "descr",          limit: 32
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "calls", force: :cascade do |t|
    t.datetime "calldate"
    t.string   "src",          limit: 80
    t.string   "dst",          limit: 80
    t.integer  "duration",     limit: 4
    t.integer  "billsec",      limit: 4
    t.string   "disposition",  limit: 45
    t.string   "uniqueid",     limit: 32
    t.string   "direction",    limit: 1
    t.string   "context",      limit: 32
    t.string   "descr",        limit: 32
    t.datetime "calldate_end"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "corp_numbers", force: :cascade do |t|
    t.integer  "address_book_corp_id", limit: 4
    t.string   "number",               limit: 255
    t.string   "type_n",               limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "domains", force: :cascade do |t|
    t.string   "host",            limit: 255
    t.integer  "port",            limit: 4
    t.string   "name",            limit: 255
    t.string   "parser_user",     limit: 255
    t.string   "parser_password", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "ip_phone_types", force: :cascade do |t|
    t.string   "model",        limit: 32
    t.integer  "num_account",  limit: 4
    t.string   "manufacturer", limit: 32
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ip_phones", force: :cascade do |t|
    t.string   "mac",              limit: 12
    t.integer  "ip_phone_type_id", limit: 4
    t.integer  "account_number",   limit: 4
    t.integer  "corp_number",      limit: 4
    t.string   "building",         limit: 255
    t.string   "room",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "sip_contexts", force: :cascade do |t|
    t.string   "name",       limit: 32
    t.string   "color",      limit: 11
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",        limit: 255
    t.string   "f_name",       limit: 255
    t.string   "i_name",       limit: 255
    t.string   "o_name",       limit: 255
    t.string   "fio",          limit: 255
    t.string   "email",        limit: 255
    t.string   "department",   limit: 255
    t.string   "position",     limit: 255
    t.boolean  "use_password", limit: 1
    t.string   "password",     limit: 255
    t.boolean  "active",       limit: 1
    t.boolean  "site_admin",   limit: 1
    t.boolean  "domain_admin", limit: 1
    t.string   "auth_hash",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
