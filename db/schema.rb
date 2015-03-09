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

ActiveRecord::Schema.define(version: 20150309031652) do

  create_table "entities", force: :cascade do |t|
    t.string   "location"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  create_table "medications", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "patient_medications", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "medication_id"
    t.string   "dose"
    t.integer  "count"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "frequency"
    t.boolean  "taken"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.time     "dose_time"
  end

  add_index "patient_medications", ["medication_id"], name: "index_patient_medications_on_medication_id"
  add_index "patient_medications", ["patient_id"], name: "index_patient_medications_on_patient_id"

  create_table "patients", force: :cascade do |t|
    t.integer  "entity_id"
    t.integer  "age"
    t.string   "contact"
    t.string   "contact_number"
    t.text     "description"
    t.string   "email"
    t.string   "gender"
    t.string   "name"
    t.string   "phone_number"
    t.string   "picture"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "patients", ["entity_id"], name: "index_patients_on_entity_id"

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
    t.string   "eamil"
    t.string   "name"
    t.boolean  "admin"
    t.integer  "access"
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
