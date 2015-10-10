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
    t.integer "kind", default: 0, null:false
    t.integer "row"
    t.integer "col"
    t.integer "row_span", default: 1, null:false
    t.integer "col_span", default: 1, null: false
    t.boolean "content_invalid",default:false,null:false
  end

  add_index "blocks", ["page_id"], name: "index_blocks_on_test_id", using: :btree
  add_index "blocks", ["user_id"], name: "index_blocks_on_user_id", using: :btree
  add_index "blocks", ["kind"], name: "index_blocks_on_kind", using: :btree

  create_table "folders", force: true do |t|
    t.integer "user_id",null:false
    t.integer "folder_id"
    t.string  "name", default:"My Folder",null: false
    t.boolean "open",           default: true, null: false
    t.integer "contents", default:0,null:false
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
    t.integer "status",null:false,default:0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groupvitations", ["sender_id"], name: "index_groupvitations_on_sender_id", using: :btree
  add_index "groupvitations", ["receiver_id","status"], name: "index_groupvitations_on_receiver_id", using: :btree
  add_index "groupvitations", ["receiver_email"], name: "index_groupvitations_on_receiver_email", using: :btree

  create_table "images", force: true do |t|
    t.integer "block_id",null:false
    t.integer "width",null:false
    t.integer "height",null:false
    t.string  "cloudinary_id",null:false
    t.integer "block_position"
  end

  add_index "images", ["block_id"], name: "index_images_on_block_id", using: :btree

  create_table "invitations", force: true do |t|
    t.integer "referrer_id", null: false
    t.integer "referral_id"
    t.string  "referral_email", null: false
    t.integer "status",null:false,default:0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["referral_id"], name: "index_invitations_on_referral_id", using: :btree,unique:true
  add_index "invitations", ["referrer_id"], name: "index_invitations_on_referrer_id", using: :btree
  add_index "invitations", ["referral_email"], name: "index_invitations_on_referral_email", using: :btree, unique:true

  create_table "lines", force: true do |t|
    t.integer "lineable_id", null:false
    t.string "lineable_type", null: false
    t.text    "content", default:"",null:false
    t.float   "position", default: 1.0, null: false
  end

  add_index "lines", ["lineable_type","lineable_id"], name: "index_lines_on_lineable_type", using: :btree

  create_table "styles", force: true do |t|
    t.integer "line_id", null:false
    t.integer    "effect", default:0,null:false
  end

  add_index "styles", ["line_id"], name: "index_styles_on_line_id", using: :btree

  create_table "pages", force: true do |t|
    t.integer "test_id", null:false
  end

  add_index "pages", ["test_id"], name: "index_pages_on_test_id", using: :btree

  create_table "plans", force: true do |t|
    t.integer "level", default: 0, null: false
    t.integer "user_id", null: false
  end

  add_index "plans", ["user_id"], name: "index_plans_on_user_id", using: :btree, unique:true

  create_table "preferences", force: true do |t|
    t.boolean "borders", default: false, null: false
    t.boolean "tour", default: true, null: false
    t.boolean "directions", default: false, null: false
    t.integer "user_id", null: false
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id", using: :btree, unique:true

  create_table "sessions", force: true do |t|
    t.string   "token", null: false, length:16
    t.integer "user_id", null: false
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", using: :btree, unique: true
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree, unique: true

  create_table "tests", force: true do |t|
    t.string  "name", default: "New Test", null:false
    t.integer "folder_id"
    t.integer "user_id", null:false
  end

  add_index "tests", ["folder_id"], name: "index_tests_on_folder_id", using: :btree

  create_table "google_auths", force: true do |t|
    t.string   "google_id", null: false
    t.string   "link"
    t.string   "refresh"
    t.integer "user_id", null: false
  end

  add_index "google_auths", ["user_id"], name: "index_google_auths_on_user_id", using: :btree, unique:true  
  add_index "google_auths", ["google_id"], name: "index_google_auths_on_google_id", using: :btree, unique:true

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "pic"
    t.integer   "gender"
    t.datetime "created_at"
    t.integer  "group_id"
    t.boolean  "guest", default: true, null: false
    t.string   "uservoice_token"
    t.integer "tests_count", default: 0, null:false
    t.integer "tests_quota", default: 25, null:false
    t.string "referred_by"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree, unique:true
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree

  create_table "tables", force: true do |t|
    t.integer "block_id",null:false
    t.integer "block_position"
  end

  add_index "tables", ["block_id"], name: "index_tables_on_block_id", using: :btree

  create_table "projections", force: true do |t|
    t.integer "table_id",null:false
    t.integer "axis",null:false,default:0
    t.float   "position", default: 1.0, null: false 
    t.integer "size"
  end

  add_index "projections", ["table_id","axis"], name: "index_tables_on_table_id", using: :btree

  create_table "cells", force: true do |t|
    t.integer "table_id",null:false
    t.integer "row_id",null:false
    t.integer "col_id",null:false
    t.text    "content", default:"",null:false
  end

  add_index "cells", ["table_id"], name: "index_cells_on_table_id", using: :btree
  add_index "cells", ["row_id"], name: "index_cells_on_row_id", using: :btree
  add_index "cells", ["col_id"], name: "index_cells_on_col_id", using: :btree

  create_table "alignments", force: true do |t|
    t.integer "alignable_id",null:false
    t.string "alignable_type",null:false
    t.integer "side",null:false,default:0
  end

  add_index "alignments", ["alignable_type","alignable_id"], name: "index_alignments_on_alignable_type", using: :btree, unique: true
  
  add_foreign_key "styles","lines", on_delete: :cascade
  add_foreign_key "cells","projections", column: "row_id", on_delete: :cascade
  add_foreign_key "cells","projections", column: "col_id", on_delete: :cascade
  add_foreign_key "projections","tables", on_delete: :cascade
  add_foreign_key "tables","blocks", on_delete: :cascade
  add_foreign_key "folders","users", on_delete: :cascade
  add_foreign_key "tests","users", on_delete: :cascade
  add_foreign_key "tests","folders", on_delete: :cascade
  add_foreign_key "sessions", "users", on_delete: :cascade
  add_foreign_key "preferences","users", on_delete: :cascade
  add_foreign_key "plans","users", on_delete: :cascade
  add_foreign_key "google_auths","users", on_delete: :cascade
  add_foreign_key "blocks","users", on_delete: :nullify
  add_foreign_key "groupvitations","users", column:"sender_id", on_delete: :cascade
  add_foreign_key "groupvitations","users", column:"receiver_id", on_delete: :cascade
  add_foreign_key "invitations","users", column:"referrer_id", on_delete: :cascade
  add_foreign_key "invitations","users", column:"referral_id", on_delete: :nullify
  add_foreign_key "images","blocks", on_delete: :cascade
  add_foreign_key "pages","tests", on_delete: :cascade

end