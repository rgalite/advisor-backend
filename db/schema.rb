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

ActiveRecord::Schema.define(version: 2019_04_26_124403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advisors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "algolia_app_id", null: false
    t.string "algolia_search_api_key", null: false
    t.string "algolia_index_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "greeting_text", null: false
    t.string "results_text", null: false
    t.string "continue_text", null: false
    t.string "results_page_text", null: false
    t.string "start_over_text", null: false
    t.string "results_page_url", null: false
    t.index ["user_id"], name: "index_advisors_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "advisor_id", null: false
    t.string "content", null: false
    t.string "algolia_facet_name", null: false
    t.integer "sort_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "skippable", default: false, null: false
    t.string "skip_text", null: false
    t.index ["advisor_id", "sort_order"], name: "index_questions_on_advisor_id_and_sort_order", unique: true
    t.index ["advisor_id"], name: "index_questions_on_advisor_id"
    t.index ["sort_order"], name: "index_questions_on_sort_order"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
