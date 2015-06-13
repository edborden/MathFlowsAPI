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
  add_index "users", ["google_id"]

  create_table "groups", force: true do |t|
    t.string "name", default: "My Group"
  end 

  create_table "invitations", force: true do |t|
    t.integer "referrer_id"
    t.integer "referral_id"
    t.string "referral_email"
    t.boolean "signup", default:false
  end  
  add_index "invitations", ["referrer_id"]
  add_index "invitations", ["referral_id"]

  create_table "folders", force: true do |t|
    t.integer  "user_id"
    t.integer "folder_id"
    t.string "name"
    t.boolean "open", default: true
    t.boolean "student_folder", default: false, null: false
    t.boolean "test_folder", default: false, null: false
  end 
  add_index "folders", ["user_id"]
  add_index "folders", ["folder_id"]

  create_table "tests", force: true do |t|
    t.string "name"
    t.integer  "folder_id"  
  end  
  add_index "tests", ["folder_id"]

  create_table "pages", force: true do |t|
    t.integer "test_id"      
  end
  add_index "pages", ["test_id"]

  create_table "blocks", force: true do |t|
    t.integer  "page_id"
    t.integer "test_id"
    t.integer "user_id"
    t.boolean "question"
    t.integer  "row"
    t.integer  "col"
    t.integer  "row_span"
    t.integer  "col_span"
    t.string "lines_height", default:0
  end 
  add_index "blocks", ["test_id"]
  add_index "blocks", ["user_id"]

  create_table "invalidations", force: true do |t|
    t.integer "block_id"
    t.string "message_type"      
  end
  add_index "invalidations", ["block_id"]

  create_table "lines", force: true do |t|
    t.integer "block_id"
    t.text "content"
    t.float "position" 
  end
  add_index "lines", ["block_id"]

  create_table "images", force: true do |t|
    t.integer  "block_id"    
    t.integer "width"
    t.integer "height"
    t.integer "scale"
    t.string "cloudinary_id"
  end 
  add_index "images", ["block_id"]

  create_table "students", force: true do |t|
    t.text  "name"
    t.string "email"
    t.integer "folder_id"
  end
  add_index "students", ["folder_id"]

  create_table "sessions", force: true do |t|
    t.text  "token"
    t.integer "user_id"
  end
  add_index "sessions", ["token"]
  add_index "sessions", ["user_id"]

end
