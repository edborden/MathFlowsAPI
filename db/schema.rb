ActiveRecord::Schema.define(version: 20141218005706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "sessions", force: true do |t|
    t.string  "token"
    t.integer "user_id"
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "smallpic"
    t.string   "mediumpic"
    t.string   "largepic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
