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

ActiveRecord::Schema.define(version: 20170921032947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title", limit: 50, null: false
    t.string "author", limit: 50, null: false
    t.datetime "first_published"
    t.integer "user_id", null: false
    t.datetime "created_on", null: false
    t.boolean "is_deleted", null: false
  end

  create_table "books_subjects", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "subject_id", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.boolean "is_deleted", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 10, null: false
    t.boolean "is_deleted", null: false
  end

  create_table "roles_permissions", id: false, force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "permission_id", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title", limit: 50, null: false
    t.boolean "is_delelted", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id", limit: 20, null: false
    t.string "password", limit: 60, null: false
    t.string "name", limit: 50, null: false
    t.string "email", limit: 50, null: false
    t.integer "role_id", null: false
    t.boolean "is_deleted", null: false
  end

  add_foreign_key "books", "users"
  add_foreign_key "books_subjects", "books"
  add_foreign_key "books_subjects", "subjects"
  add_foreign_key "roles_permissions", "permissions"
  add_foreign_key "roles_permissions", "roles"
  add_foreign_key "users", "roles"
end
