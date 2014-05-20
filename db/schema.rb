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

ActiveRecord::Schema.define(version: 20140519200336) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.decimal  "rating"
    t.integer  "category_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id"
  add_index "articles", ["category_id"], name: "index_articles_on_category_id"
  add_index "articles", ["rating", "created_at"], name: "index_articles_on_rating_and_created_at"

  create_table "authors", force: true do |t|
    t.string   "login"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["login"], name: "index_authors_on_login"

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "mark"
    t.integer  "author_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"
  add_index "comments", ["author_id"], name: "index_comments_on_author_id"

end
