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

ActiveRecord::Schema.define(version: 20150213145010) do

  create_table "address_book_corps", force: true do |t|
    t.string   "login"
    t.string   "fio"
    t.string   "email"
    t.string   "position"
    t.string   "department"
    t.string   "organisation"
    t.string   "address"
    t.boolean  "have_phones"
    t.boolean  "have_email"
    t.boolean  "active"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "asterisk_logs", force: true do |t|
    t.datetime "calldate"
    t.string   "clid",        limit: 80
    t.string   "src",         limit: 80
    t.string   "dst",         limit: 80
    t.string   "dcontext",    limit: 80
    t.string   "channel",     limit: 80
    t.string   "dstchannel",  limit: 80
    t.string   "lastapp",     limit: 80
    t.string   "lastdata",    limit: 80
    t.integer  "duration"
    t.integer  "billsec"
    t.string   "disposition", limit: 45
    t.integer  "amaflags"
    t.string   "accountcode", limit: 20
    t.string   "uniqueid",    limit: 32
    t.string   "userfield"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "calls", force: true do |t|
    t.datetime "calldate"
    t.string   "src",         limit: 80
    t.string   "dst",         limit: 80
    t.integer  "duration"
    t.integer  "billsec"
    t.string   "disposition", limit: 45
    t.string   "uniqueid",    limit: 32
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "corp_numbers", force: true do |t|
    t.integer  "address_book_corp_id"
    t.string   "number"
    t.string   "type_n"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "domains", force: true do |t|
    t.string   "host"
    t.integer  "port"
    t.string   "name"
    t.string   "parser_user"
    t.string   "parser_password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "f_name"
    t.string   "i_name"
    t.string   "o_name"
    t.string   "fio"
    t.string   "email"
    t.string   "department"
    t.string   "position"
    t.boolean  "use_password"
    t.string   "password"
    t.boolean  "active"
    t.boolean  "site_admin"
    t.boolean  "domain_admin"
    t.string   "auth_hash"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
