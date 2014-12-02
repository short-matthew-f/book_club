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

ActiveRecord::Schema.define(version: 20141127232516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: true do |t|
    t.string   "title",      null: false
    t.string   "author",     null: false
    t.string   "cover_url"
    t.string   "asin",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["asin"], name: "index_books_on_asin", unique: true, using: :btree
  add_index "books", ["author"], name: "index_books_on_author", using: :btree
  add_index "books", ["title"], name: "index_books_on_title", using: :btree

  create_table "clubs", force: true do |t|
    t.integer  "owner_id",    null: false
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clubs", ["owner_id"], name: "index_clubs_on_owner_id", using: :btree

  create_table "friendships", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "friend_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true, using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "name"
    t.string   "location"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommendations", force: true do |t|
    t.integer  "recommender_id", null: false
    t.integer  "club_id",        null: false
    t.integer  "book_id",        null: false
    t.text     "description",    null: false
    t.text     "inscription",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recommendations", ["book_id"], name: "index_recommendations_on_book_id", using: :btree
  add_index "recommendations", ["club_id"], name: "index_recommendations_on_club_id", using: :btree
  add_index "recommendations", ["recommender_id", "club_id", "book_id"], name: "index_recommendations_on_recommender_id_and_club_id_and_book_id", unique: true, using: :btree
  add_index "recommendations", ["recommender_id"], name: "index_recommendations_on_recommender_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
