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

ActiveRecord::Schema.define(version: 20140218150203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: true do |t|
    t.string   "title",      null: false
    t.integer  "play_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "acts", ["play_id"], name: "index_acts_on_play_id", using: :btree
  add_index "acts", ["title", "play_id"], name: "index_acts_on_title_and_play_id", unique: true, using: :btree

  create_table "lines", force: true do |t|
    t.string   "line_text",  null: false
    t.integer  "speech_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lines", ["speech_id"], name: "index_lines_on_speech_id", using: :btree

  create_table "plays", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plays", ["title"], name: "index_plays_on_title", unique: true, using: :btree

  create_table "scenes", force: true do |t|
    t.string   "title",      null: false
    t.integer  "act_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scenes", ["act_id"], name: "index_scenes_on_act_id", using: :btree
  add_index "scenes", ["title", "act_id"], name: "index_scenes_on_title_and_act_id", unique: true, using: :btree

  create_table "speakers", force: true do |t|
    t.string   "name",       null: false
    t.integer  "play_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "speakers", ["name", "play_id"], name: "index_speakers_on_name_and_play_id", unique: true, using: :btree
  add_index "speakers", ["play_id"], name: "index_speakers_on_play_id", using: :btree

  create_table "speeches", force: true do |t|
    t.integer  "speaker_id", null: false
    t.integer  "scene_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "speeches", ["scene_id"], name: "index_speeches_on_scene_id", using: :btree
  add_index "speeches", ["speaker_id"], name: "index_speeches_on_speaker_id", using: :btree

end
