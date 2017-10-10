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

ActiveRecord::Schema.define(version: 20171010163150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plants", force: :cascade do |t|
    t.string "umn_plantID"
    t.string "common_name"
    t.string "scientific_name"
    t.string "height"
    t.string "spread"
    t.string "form"
    t.string "seasonal_interest"
    t.string "seasonal_interest_specific"
    t.string "flower_color"
    t.string "landscape_use"
    t.string "light"
    t.string "zone"
    t.string "soil"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plants_plots", id: false, force: :cascade do |t|
    t.bigint "plot_id", null: false
    t.bigint "plant_id", null: false
    t.index ["plant_id", "plot_id"], name: "index_plants_plots_on_plant_id_and_plot_id"
    t.index ["plot_id", "plant_id"], name: "index_plants_plots_on_plot_id_and_plant_id"
  end

  create_table "plots", force: :cascade do |t|
    t.string "name"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_plots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.text "bio"
    t.string "location"
    t.string "api_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zip"
    t.index ["api_token"], name: "index_users_on_api_token", unique: true
  end

  add_foreign_key "plots", "users"
end
