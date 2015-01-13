ActiveRecord::Schema.define(version: 20141218005706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.boolean  "guest",                        default: true, null: false
    t.string   "email"
    t.string   "name"
    t.string   "smallpic"
    t.string   "mediumpic"
    t.string   "largepic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flows", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string  "page_width", default: "8.5",null: false
    t.string  "page_height", default: "11.5",null: false
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
    t.integer  "width", default: 1
    t.integer  "height", default: 1
  end

  create_table "blocks", force: true do |t|
  end 

  create_table "snippets", force: true do |t|
    t.text  "content", default: "+"
    t.boolean "has_image", default: false, null: false
    t.boolean "has_equation", default: false, null: false   
  end

  create_table "equations", force: true do |t|
    t.integer  "snippet_id"
    t.string "latex"
  end  

  create_table "images", force: true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"    
    t.binary "data"
    t.integer "height"
    t.integer "width"
    t.string "ext"
  end 

  create_table "layouts", force: true do |t|
    t.integer  "layoutable_id"
    t.string   "layoutable_type" 
    t.integer  "rows", default: 8, null: false
    t.integer  "cols", default: 4, null: false
    t.integer "base_height",default: 1, null: false
    t.integer "base_width",default: 1, null: false    
  end 

  create_table "sessions", force: true do |t|
    t.text  "token"
    t.string "token_source",        default: "issued", null: false
    t.integer "user_id"
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", using: :btree

end
