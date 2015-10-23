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

ActiveRecord::Schema.define(version: 20151018200728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "number"
    t.string   "street",     limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.integer  "zip"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "service_requests", force: :cascade do |t|
    t.string   "address",         limit: 255
    t.string   "title",           limit: 255
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.integer  "status"
    t.date     "warning_date"
    t.date     "alert_date"
    t.string   "call_back_phone", limit: 255
    t.string   "caller_name",     limit: 255
    t.integer  "category_id"
    t.text     "work_performed"
  end

  add_index "service_requests", ["category_id"], name: "index_service_requests_on_category_id", using: :btree
  add_index "service_requests", ["user_id"], name: "index_service_requests_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
