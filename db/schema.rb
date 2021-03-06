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

ActiveRecord::Schema.define(version: 20150213174145) do

  create_table "meetups", force: true do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "event_date"
    t.integer  "organizer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration",     default: 1
    t.text     "description"
    t.string   "slug"
  end

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.string   "joinable_type"
    t.integer  "joinable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "progress_logs", force: true do |t|
    t.text     "message"
    t.string   "mood"
    t.integer  "todont_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "success_days", force: true do |t|
    t.integer  "todont_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "support_groups", force: true do |t|
    t.integer  "moderator_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "todonts", force: true do |t|
    t.string   "body"
    t.string   "visibility", default: "private"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "slug"
    t.string   "email"
  end

end
