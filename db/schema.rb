# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_01_03_233942) do
  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists_recordings", id: false, force: :cascade do |t|
    t.integer "artist_id"
    t.integer "recording_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artists_recordings_on_artist_id"
    t.index ["recording_id"], name: "index_artists_recordings_on_recording_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "expired_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_recordings", id: false, force: :cascade do |t|
    t.integer "order_id"
    t.integer "recording_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_orders_recordings_on_order_id"
    t.index ["recording_id"], name: "index_orders_recordings_on_recording_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.string "name"
    t.string "composer"
    t.string "composition_year"
    t.string "form"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "catalogue_num"
    t.index ["composer"], name: "index_pieces_on_composer"
    t.index ["form"], name: "index_pieces_on_form"
    t.index ["name"], name: "index_pieces_on_name"
  end

  create_table "pieces_recordings", id: false, force: :cascade do |t|
    t.integer "piece_id"
    t.integer "recording_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_pieces_recordings_on_piece_id"
    t.index ["recording_id"], name: "index_pieces_recordings_on_recording_id"
  end

  create_table "recordings", force: :cascade do |t|
    t.string "name"
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "quantity", default: 0
    t.index ["quantity"], name: "index_recordings_on_quantity"
    t.index ["release_date"], name: "index_recordings_on_release_date"
  end

  create_table "scores", force: :cascade do |t|
    t.string "name"
    t.string "composer"
    t.string "publisher"
    t.string "instrument"
    t.integer "page_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "piece_id", null: false
    t.index ["composer"], name: "index_scores_on_composer"
    t.index ["instrument"], name: "index_scores_on_instrument"
    t.index ["name"], name: "index_scores_on_name"
    t.index ["piece_id"], name: "index_scores_on_piece_id"
    t.index ["publisher"], name: "index_scores_on_publisher"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "scores", "pieces"
end
