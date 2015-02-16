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
    t.integer "header_id"
    t.integer "group_id"
  end

  create_table "groups", force: true do |t|
    t.string "name", default: "My Group"
  end 

  create_table "invitations", force: true do |t|
    t.integer "referrer_id"
    t.integer "referral_id"
    t.string "referral_email"
  end  

  create_table "folders", force: true do |t|
    t.integer  "user_id"
    t.string "name", default: "New Folder"
  end 

  create_table "flows", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "folder_id"
    t.string "name", default: "New Flow"
  end 

  create_table "documents", force: true do |t|
    t.integer  "flow_id"  
  end  

  create_table "pages", force: true do |t|
    t.integer "document_id"      
  end

  create_table "positions", force: true do |t|
    t.integer  "positionable_id"
    t.string   "positionable_type"  
    t.integer  "owner_id"
    t.string   "owner_type"  
    t.integer  "row"
    t.integer  "col"
    t.integer  "row_span"
    t.integer  "col_span"
    t.string "type"
  end

  create_table "blocks", force: true do |t|
    t.boolean "question", default: true,null:false
  end 

  create_table "snippets", force: true do |t|
    t.text  "content", default: "+"
    t.boolean "has_image"
    t.boolean "has_equation"
    t.boolean "question_number", default: false
  end

  create_table "equations", force: true do |t|
    t.integer  "snippet_id"
    t.string "latex"
  end  

  create_table "images", force: true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"    
    t.binary "data"
    t.integer "width"
    t.integer "height"
    t.string "ext"
  end 

  create_table "layouts", force: true do |t|
    t.integer  "user_id"
    t.integer  "page_cols", default: 4
    t.float "page_row_height", default: 18 # line height of 12pt font
    t.float "page_col_width", default: 128.25
    t.float  "page_width", default: 8.5 * 72 #8.5 inches
    t.float  "page_height", default: 11 * 72 #11 inches
    t.float "page_outside_margin", default: 0.5 * 72 #1/2 inch
    t.float "page_inside_margin", default: 9 #1/2 line height of 12pt font
    t.integer "block_cols", default: 16
    t.float "block_row_height", default: 18
  end 

  create_table "sessions", force: true do |t|
    t.text  "token"
    t.integer "user_id"
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", using: :btree

end
