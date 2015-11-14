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

ActiveRecord::Schema.define(version: 20151114155408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.integer  "category_id"
    t.date     "date"
    t.text     "text"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "middlename"
    t.string   "position"
    t.string   "organization"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "event_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.integer  "document_type_id"
    t.text     "text"
    t.string   "document_file_file_name"
    t.string   "document_file_content_type"
    t.integer  "document_file_file_size"
    t.datetime "document_file_updated_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.integer  "category_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "info_activated",           default: false
    t.text     "info_text"
    t.string   "info_file_file_name"
    t.string   "info_file_content_type"
    t.integer  "info_file_file_size"
    t.datetime "info_file_updated_at"
    t.boolean  "tasks_activated",          default: false
    t.text     "tasks_text"
    t.string   "tasks_file_file_name"
    t.string   "tasks_file_content_type"
    t.integer  "tasks_file_file_size"
    t.datetime "tasks_file_updated_at"
    t.boolean  "events_activated",         default: false
    t.text     "events_text"
    t.string   "events_file_file_name"
    t.string   "events_file_content_type"
    t.integer  "events_file_file_size"
    t.datetime "events_file_updated_at"
    t.boolean  "published",                default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "user_id"
  end

  create_table "events_subjects", force: :cascade do |t|
    t.integer "event_id"
    t.integer "subject_id"
  end

  create_table "frequent_questions", force: :cascade do |t|
    t.integer  "sn"
    t.text     "question"
    t.text     "answer"
    t.boolean  "published",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
  end

  create_table "local_resources", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "site_questions", force: :cascade do |t|
    t.string   "name"
    t.text     "question"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_options", force: :cascade do |t|
    t.text     "text"
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "title"
    t.text     "question"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.integer  "department_id"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
