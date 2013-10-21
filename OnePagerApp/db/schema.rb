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

ActiveRecord::Schema.define(version: 20131019142510) do

  create_table "anonymous_users", force: true do |t|
    t.string   "email",      limit: 30
    t.integer  "counter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mig_users", force: true do |t|
    t.string   "email",      limit: 30
    t.string   "password",   limit: 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "one_pagers", force: true do |t|
    t.integer  "user_id"
    t.string   "patent_name"
    t.string   "html_link"
    t.string   "pdf_link"
    t.string   "img_link"
    t.string   "company_name"
    t.string   "single_patent_num", limit: 15
    t.string   "type",              limit: 15
    t.string   "mig_status",        limit: 15
    t.boolean  "created_status"
    t.boolean  "email_status"
    t.text     "comments"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "one_pagers_patent_nums", force: true do |t|
    t.integer  "one_pager_id"
    t.string   "patent_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "one_pagers_tags", force: true do |t|
    t.integer  "one_pager_id"
    t.string   "tag",          limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "one_pager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password",          limit: 16
    t.boolean  "confirmed"
    t.boolean  "one_pager_allowed"
    t.boolean  "blocked"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
