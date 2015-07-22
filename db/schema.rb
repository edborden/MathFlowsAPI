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

ActiveRecord::Schema.define(version: 20150718222534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: true do |t|
    t.integer "page_id"
    t.integer "test_id"
    t.integer "user_id"
    t.boolean "question"
    t.integer "row"
    t.integer "col"
    t.integer "row_span"
    t.integer "col_span"
    t.string  "lines_height", default: "0"
  end

  add_index "blocks", ["test_id"], name: "index_blocks_on_test_id", using: :btree
  add_index "blocks", ["user_id"], name: "index_blocks_on_user_id", using: :btree

  create_table "folders", force: true do |t|
    t.integer "user_id"
    t.integer "folder_id"
    t.string  "name"
    t.boolean "open",           default: true
    t.boolean "student_folder", default: false, null: false
    t.boolean "test_folder",    default: false, null: false
  end

  add_index "folders", ["folder_id"], name: "index_folders_on_folder_id", using: :btree
  add_index "folders", ["user_id"], name: "index_folders_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.string "name", default: "My Group"
  end

  create_table "images", force: true do |t|
    t.integer "block_id"
    t.integer "width"
    t.integer "height"
    t.integer "scale"
    t.string  "cloudinary_id"
  end

  add_index "images", ["block_id"], name: "index_images_on_block_id", using: :btree

  create_table "invalidations", force: true do |t|
    t.integer "block_id"
    t.string  "message_type"
  end

  add_index "invalidations", ["block_id"], name: "index_invalidations_on_block_id", using: :btree

  create_table "invitations", force: true do |t|
    t.integer "referrer_id"
    t.integer "referral_id"
    t.string  "referral_email"
    t.boolean "signup",         default: false
  end

  add_index "invitations", ["referral_id"], name: "index_invitations_on_referral_id", using: :btree
  add_index "invitations", ["referrer_id"], name: "index_invitations_on_referrer_id", using: :btree

  create_table "lines", force: true do |t|
    t.integer "block_id"
    t.text    "content"
    t.float   "position"
  end

  add_index "lines", ["block_id"], name: "index_lines_on_block_id", using: :btree

  create_table "pages", force: true do |t|
    t.integer "test_id"
  end

  add_index "pages", ["test_id"], name: "index_pages_on_test_id", using: :btree

  create_table "preferences", force: true do |t|
    t.boolean "borders", default: false, null: false
    t.boolean "directions", default: false, null: false
    t.integer "user_id", null: false
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id", using: :btree  

  create_table "sessions", force: true do |t|
    t.text    "token"
    t.integer "user_id"
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", using: :btree
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "students", force: true do |t|
    t.text    "name"
    t.string  "email"
    t.integer "folder_id"
  end

  add_index "students", ["folder_id"], name: "index_students_on_folder_id", using: :btree

  create_table "tests", force: true do |t|
    t.string  "name"
    t.integer "folder_id"
  end

  add_index "tests", ["folder_id"], name: "index_tests_on_folder_id", using: :btree

  create_table "users", force: true do |t|
    t.boolean  "guest",           default: true, null: false
    t.string   "email"
    t.string   "name"
    t.string   "pic"
    t.string   "google_id"
    t.string   "gender"
    t.string   "google_link"
    t.string   "google_refresh"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.boolean  "premium"
    t.string   "uservoice_token"
  end

  add_index "users", ["google_id"], name: "index_users_on_google_id", using: :btree

end
