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

ActiveRecord::Schema.define(version: 20140622183856) do

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "instruction"
    t.string   "tagline"
  end

  create_table "children", force: true do |t|
    t.string   "content"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.string   "name"
    t.datetime "date_of_birth"
  end

  create_table "parents", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.integer  "children_number"
  end

  add_index "parents", ["email"], name: "index_parents_on_email", unique: true
  add_index "parents", ["remember_token"], name: "index_parents_on_remember_token"

  create_table "relationships", force: true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["child_id"], name: "index_relationships_on_child_id"
  add_index "relationships", ["parent_id", "child_id"], name: "index_relationships_on_parent_id_and_child_id", unique: true
  add_index "relationships", ["parent_id"], name: "index_relationships_on_parent_id"

end
