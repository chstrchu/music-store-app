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

ActiveRecord::Schema[7.2].define(version: 2024_12_30_214757) do
  create_table "artist_recordings", id: false, force: :cascade do |t|
    t.integer "artist_id"
    t.integer "recording_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_recordings_on_artist_id"
    t.index ["recording_id"], name: "index_artist_recordings_on_recording_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.string "name"
    t.string "composer"
    t.string "composition_year"
    t.string "form"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "scores", "pieces"
end
