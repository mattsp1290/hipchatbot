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

ActiveRecord::Schema.define(version: 20150108183622) do

  create_table "hip_chat_events", force: true do |t|
    t.string   "webhook_type"
    t.datetime "date"
    t.string   "mention_name"
    t.string   "message"
    t.integer  "room"
    t.integer  "webhook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hooks", force: true do |t|
    t.string   "room"
    t.string   "url"
    t.string   "event"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "migrations", force: true do |t|
    t.string   "number"
    t.string   "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "reddit_posts", force: true do |t|
    t.string   "subreddit"
    t.string   "text"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reddits", force: true do |t|
    t.string   "room"
    t.string   "subreddit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "replies", force: true do |t|
    t.string   "room"
    t.string   "mention_name"
    t.text     "keywords"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
