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

ActiveRecord::Schema.define(version: 2019_05_05_115505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "quests", force: :cascade do |t|
    t.string "task"
    t.string "description"
    t.integer "reward"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms_quests", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "quest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quest_id"], name: "index_rooms_quests_on_quest_id"
    t.index ["room_id"], name: "index_rooms_quests_on_room_id"
  end

  create_table "top_users", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "level"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_top_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "email"
    t.integer "level"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_quests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quest_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quest_id"], name: "index_users_quests_on_quest_id"
    t.index ["user_id"], name: "index_users_quests_on_user_id"
  end

  create_table "users_rooms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_users_rooms_on_room_id"
    t.index ["user_id"], name: "index_users_rooms_on_user_id"
  end

end
