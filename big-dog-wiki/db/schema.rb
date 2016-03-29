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

ActiveRecord::Schema.define(version: 20160329150327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.integer  "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "articles", ["creator_id"], name: "index_articles_on_creator_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.integer  "version_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categorizations", ["version_id"], name: "index_categorizations_on_version_id", using: :btree

  create_table "sources", force: :cascade do |t|
    t.string   "url",        null: false
    t.integer  "version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sources", ["version_id"], name: "index_sources_on_version_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",                           null: false
    t.string   "email",                              null: false
    t.string   "password_digest",                    null: false
    t.string   "clearance",       default: "editor", null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "published",  default: false
    t.integer  "article_id"
    t.integer  "editor_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "versions", ["article_id"], name: "index_versions_on_article_id", using: :btree
  add_index "versions", ["editor_id"], name: "index_versions_on_editor_id", using: :btree

end
