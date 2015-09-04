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

ActiveRecord::Schema.define(version: 20150904053235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "homes", force: :cascade do |t|
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
  end

  create_table "rooms", force: :cascade do |t|
    t.text     "type"
    t.text     "occupant"
    t.text     "description"
    t.text     "image"
    t.integer  "rent"
    t.integer  "home_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "image"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "email"
    t.text     "phone"
    t.date     "birthday"
    t.date     "moved_in"
    t.integer  "room_id"
    t.integer  "location_id"
    t.boolean  "is_house_admin"
    t.boolean  "is_admin"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
