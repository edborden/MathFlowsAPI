ActiveRecord::Schema.define(version: 20141218005706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.boolean  "guest",                        default: true, null: false
    t.string   "email"
    t.string   "name"
    t.string   "pic"
    t.string   "google_id"
    t.string   "gender"
    t.string   "google_link"
    t.string   "google_refresh"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "group_id"
    t.boolean "premium"
  end
  add_index "users", ["google_id"], using: :btree

  create_table "groups", force: true do |t|
    t.string "name", default: "My Group"
  end 

  create_table "invitations", force: true do |t|
    t.integer "referrer_id"
    t.integer "referral_id"
    t.string "referral_email"
    t.boolean "signup", default:false
  end  
  add_index "invitations", ["referrer_id","referral_id"], using: :btree

  create_table "folders", force: true do |t|
    t.integer  "user_id"
    t.integer "folder_id"
    t.string "name", default: "New Folder"
    t.boolean "open", default: true
    t.boolean "student_folder", default: false, null: false
    t.boolean "flow_folder", default: false, null: false
  end 
  add_index "folders", ["user_id"], using: :btree

  create_table "flows", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "folder_id"
    t.string "name", default: "New Flow"
    t.boolean "open", default: true
  end 
  add_index "flows", ["folder_id"], using: :btree

  create_table "documents", force: true do |t|
    t.string "name", default: "New Test"
    t.integer  "flow_id"  
  end  
  add_index "documents", ["flow_id"], using: :btree

  create_table "pages", force: true do |t|
    t.integer "document_id"      
  end
  add_index "pages", ["document_id"], using: :btree

  create_table "positions", force: true do |t|
    t.integer  "block_id"  
    t.integer  "page_id"  
    t.integer  "row"
    t.integer  "col"
    t.integer  "row_span"
    t.integer  "col_span"
    t.integer "user_id"
  end
  add_index "positions", ["page_id","block_id"], using: :btree

  create_table "blocks", force: true do |t|
    t.boolean "question", default: true,null:false
    t.text  "content"
  end 

  create_table "images", force: true do |t|
    t.integer  "block_id"    
    t.integer "width"
    t.integer "height"
    t.integer "scale"
    t.string "cloudinary_id"
  end 
  add_index "images", ["block_id"], using: :btree

  create_table "layouts", force: true do |t|
    t.integer  "user_id"
    t.integer  "cols", default: 4
    t.float "row_height", default: 18 # line height of 12pt font
    t.float "col_width", default: 128.25
    t.float  "width", default: 8.5 * 72 #8.5 inches
    t.float  "height", default: 11 * 72 #11 inches
    t.float "outside_margin", default: 0.5 * 72 #1/2 inch
    t.float "inside_margin", default: 9 #1/2 line height of 12pt font
  end 
  add_index "layouts", ["user_id"], using: :btree

  create_table "students", force: true do |t|
    t.text  "name"
    t.string "email"
    t.integer "folder_id"
  end
  add_index "students", ["folder_id"], using: :btree

  create_table "sessions", force: true do |t|
    t.text  "token"
    t.integer "user_id"
  end
  add_index "sessions", ["token","user_id"], using: :btree

end
