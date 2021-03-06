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

ActiveRecord::Schema.define(version: 2021_09_23_115207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "frequencies", force: :cascade do |t|
    t.string "word"
    t.bigint "count"
    t.bigint "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "color_r", default: 0
    t.integer "color_g", default: 0
    t.integer "color_b", default: 0
  end

  create_table "matrices", force: :cascade do |t|
    t.string "mat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "missings", force: :cascade do |t|
    t.string "word"
    t.bigint "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "names", force: :cascade do |t|
    t.string "firstName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rank"
    t.integer "color_r", default: 0
    t.integer "color_g", default: 0
    t.integer "color_b", default: 0
  end

  create_table "numbers", force: :cascade do |t|
    t.integer "name"
    t.integer "color_r", default: 0
    t.integer "color_g", default: 0
    t.integer "color_b", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "texts", force: :cascade do |t|
    t.string "word"
    t.bigint "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "color_r", default: 0
    t.integer "color_g", default: 0
    t.integer "color_b", default: 0
  end

  create_table "word_frequencies", force: :cascade do |t|
    t.bigint "rank"
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "count"
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
    t.bigint "count"
    t.bigint "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
