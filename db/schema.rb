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

ActiveRecord::Schema.define(version: 20180614095848) do

  create_table "companies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "companyname"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "freedays", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "begin"
    t.date     "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skill_masters", force: :cascade do |t|
    t.string   "skilltype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_master_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "status_masters", force: :cascade do |t|
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "skill_master_id"
    t.integer  "status_master_id"
    t.date     "date"
    t.integer  "score"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "mail_address"
    t.string   "string"
    t.string   "pass"
    t.string   "usertype"
    t.string   "integer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
