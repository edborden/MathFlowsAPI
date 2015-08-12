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
    t.integer "user_id"
    t.boolean "question", default: false, null:false
    t.integer "row"
    t.integer "col"
    t.integer "row_span", default: 1, null:false
    t.integer "col_span", default: 1, null: false
    t.string  "lines_height", default: "0", null: false
    t.boolean "header", default: false, null:false
  end

  add_index "blocks", ["page_id"], name: "index_blocks_on_test_id", using: :btree
  add_index "blocks", ["user_id"], name: "index_blocks_on_user_id", using: :btree

  create_table "folders", force: true do |t|
    t.integer "user_id"
    t.integer "folder_id"
    t.string  "name", default:"My Folder",null: false
    t.boolean "open",           default: true, null: false
    t.boolean "student_folder", default: false, null: false
    t.boolean "test_folder",    default: false, null: false
  end

  add_index "folders", ["folder_id"], name: "index_folders_on_folder_id", using: :btree
  add_index "folders", ["user_id"], name: "index_folders_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.string "name", default: "My Group", null:false
    t.integer "users_count", default: 0, null: false
  end

  create_table "groupvitations", force: true do |t|
    t.integer "sender_id", null: false
    t.integer "receiver_id"
    t.string  "receiver_email", null: false
    t.boolean "accepted", default: false, null: false    
    t.boolean "declined", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groupvitations", ["sender_id"], name: "index_groupvitations_on_sender_id", using: :btree
  add_index "groupvitations", ["receiver_id"], name: "index_groupvitations_on_receiver_id", using: :btree
  add_index "groupvitations", ["receiver_email"], name: "index_groupvitations_on_receiver_email", using: :btree

  create_table "images", force: true do |t|
    t.integer "block_id"
    t.integer "width"
    t.integer "height"
    t.integer "scale", default: 5
    t.string  "cloudinary_id"
  end

  add_foreign_key "images","blocks", on_delete: :cascade

  add_index "images", ["block_id"], name: "index_images_on_block_id", using: :btree

  create_table "invalidations", force: true do |t|
    t.integer "block_id"
    t.string  "message_type", null: false
  end

  add_foreign_key "invalidations","blocks", on_delete: :cascade

  add_index "invalidations", ["block_id"], name: "index_invalidations_on_block_id", using: :btree

  create_table "invitations", force: true do |t|
    t.integer "referrer_id", null: false
    t.integer "referral_id"
    t.string  "referral_email", null: false, unique: true
    t.boolean "visited", default: false, null: false
    t.boolean "signed_up", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["referral_id"], name: "index_invitations_on_referral_id", using: :btree
  add_index "invitations", ["referrer_id"], name: "index_invitations_on_referrer_id", using: :btree
  add_index "invitations", ["referral_email"], name: "index_invitations_on_referral_email", using: :btree, unique:true

  create_table "lines", force: true do |t|
    t.integer "block_id"
    t.text    "content", default:"",null:false
    t.float   "position", default: 1, null: false
  end

  add_foreign_key "lines","blocks", on_delete: :cascade

  add_index "lines", ["block_id"], name: "index_lines_on_block_id", using: :btree

  create_table "pages", force: true do |t|
    t.integer "test_id"
  end

  add_index "pages", ["test_id"], name: "index_pages_on_test_id", using: :btree

  create_table "preferences", force: true do |t|
    t.boolean "borders", default: false, null: false
    t.boolean "directions", default: true, null: false
    t.integer "user_id", null: false
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id", using: :btree, unique:true

  create_table "sessions", force: true do |t|
    t.string   "token", null: false, length:16
    t.integer "user_id", null: false
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", using: :btree, unique: true
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree, unique: true

  create_table "students", force: true do |t|
    t.text    "name"
    t.string  "email"
    t.integer "folder_id"
  end

  add_index "students", ["folder_id"], name: "index_students_on_folder_id", using: :btree

  create_table "tests", force: true do |t|
    t.string  "name", default: "New Test", null:false
    t.integer "folder_id"
    t.integer "user_id"
  end

  add_foreign_key "pages","tests", on_delete: :cascade

  add_index "tests", ["folder_id"], name: "index_tests_on_folder_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "pic"
    t.string   "google_id"
    t.string   "gender"
    t.string   "google_link"
    t.string   "google_refresh"
    t.datetime "created_at"
    t.integer  "group_id"
    t.boolean  "premium", default: false, null: false
    t.boolean  "guest", default: true, null: false
    t.boolean "premium_trial", default: false, null: false
    t.string   "uservoice_token"
    t.integer "tests_count", default: 0, null:false
    t.integer "tests_quota", default: 25, null:false
    t.string "referred_by"
  end

  add_foreign_key "folders","users", on_delete: :cascade
  add_foreign_key "tests","users", on_delete: :cascade
  add_foreign_key "sessions", "users", on_delete: :cascade
  add_foreign_key "preferences","users", on_delete: :cascade

  add_index "users", ["google_id"], name: "index_users_on_google_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree

end