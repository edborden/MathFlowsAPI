ActiveRecord::Schema.define(version: 20141218005706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: true do |t|
    t.integer  "row", default: 1
    t.integer  "col", default: 1
    t.integer  "width", default: 1
    t.integer  "height", default: 1
    t.integer "layout_id"
  end 

  create_table "layouts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"    
  end 

  create_table "sessions", force: true do |t|
    t.text  "token"
    t.string "token_source",        default: "issued", null: false
    t.integer "user_id"
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", using: :btree

  create_table "snippets", force: true do |t|
    t.text  "content", default: "+"
    t.boolean "equation", default: false, null:false
    t.integer "block_id"
  end

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

end
