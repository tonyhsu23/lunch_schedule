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

ActiveRecord::Schema.define(version: 20160606073717) do

  create_table "companies", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["name"], name: "index_companies_on_name"

  create_table "departments", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "departments", ["company_id"], name: "index_departments_on_company_id"
  add_index "departments", ["name"], name: "index_departments_on_name"

  create_table "dish_categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dish_categories", ["name"], name: "index_dish_categories_on_name"

  create_table "dishes", force: :cascade do |t|
    t.string   "name",             null: false
    t.integer  "price"
    t.integer  "dish_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "dishes", ["dish_category_id"], name: "index_dishes_on_dish_category_id"
  add_index "dishes", ["name"], name: "index_dishes_on_name"

  create_table "event_dishes", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_dishes", ["dish_id"], name: "index_event_dishes_on_dish_id"
  add_index "event_dishes", ["event_id"], name: "index_event_dishes_on_event_id"

  create_table "event_people", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_people", ["event_id"], name: "index_event_people_on_event_id"
  add_index "event_people", ["user_id"], name: "index_event_people_on_user_id"

  create_table "events", force: :cascade do |t|
    t.date     "date"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "events", ["date"], name: "index_events_on_date"
  add_index "events", ["restaurant_id"], name: "index_events_on_restaurant_id"

  create_table "restaurant_categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "restaurant_categories", ["name"], name: "index_restaurant_categories_on_name"

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                   null: false
    t.text     "address"
    t.string   "phone_number"
    t.integer  "restaurant_category_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "restaurants", ["name"], name: "index_restaurants_on_name"
  add_index "restaurants", ["restaurant_category_id"], name: "index_restaurants_on_restaurant_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "chinese_first_name"
    t.string   "chinese_last_name"
    t.boolean  "is_serving"
    t.integer  "company_id"
    t.integer  "department_id"
  end

  add_index "users", ["chinese_first_name"], name: "index_users_on_chinese_first_name"
  add_index "users", ["chinese_last_name"], name: "index_users_on_chinese_last_name"
  add_index "users", ["company_id"], name: "index_users_on_company_id"
  add_index "users", ["department_id"], name: "index_users_on_department_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["first_name"], name: "index_users_on_first_name"
  add_index "users", ["last_name"], name: "index_users_on_last_name"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
