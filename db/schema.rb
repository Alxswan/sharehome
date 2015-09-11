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

ActiveRecord::Schema.define(version: 20150910234852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.date     "bill_start"
    t.date     "bill_end"
    t.text     "name"
    t.text     "bill_type"
    t.text     "image"
    t.integer  "amount"
    t.integer  "home_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "check_items", force: :cascade do |t|
    t.text     "task"
    t.integer  "user_id"
    t.integer  "checklist_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "checklists", force: :cascade do |t|
    t.text     "name"
    t.integer  "home_id"
    t.integer  "bill_id"
    t.integer  "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.text     "name"
    t.text     "address"
    t.text     "description"
    t.text     "image"
    t.text     "apartment_number"
    t.text     "street_number"
    t.text     "city"
    t.text     "state"
    t.text     "country"
    t.text     "zip"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "block_id"
    t.integer  "street_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "password_digest"
  end

  create_table "meetings", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "home_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "home_id"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.date     "move_in"
    t.date     "move_out"
    t.integer  "home_id"
    t.integer  "room_id"
    t.integer  "user_id"
    t.text     "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.text     "occupant"
    t.text     "description"
    t.text     "image"
    t.integer  "rent"
    t.integer  "home_id"
    t.date     "user_movedin"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "image"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "email"
    t.text     "phone"
    t.date     "birthday"
    t.date     "moved_in"
    t.text     "paypal_me"
    t.integer  "room_id"
    t.integer  "location_id"
    t.boolean  "is_house_admin"
    t.boolean  "is_admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "password_digest"
  end

end
