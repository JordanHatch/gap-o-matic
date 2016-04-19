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

ActiveRecord::Schema.define(version: 20160419104936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dashboards", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer  "dashboard_id"
    t.string   "title",                        null: false
    t.string   "description"
    t.integer  "percent",                      null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "deleted",      default: false
    t.integer  "order",        default: 0
  end

  add_index "entries", ["dashboard_id"], name: "index_entries_on_dashboard_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "email",        null: false
    t.string   "provider",     null: false
    t.string   "provider_uid", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
