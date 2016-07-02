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

ActiveRecord::Schema.define(version: 20160702000934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "first_preferences", force: :cascade do |t|
    t.string  "state_ab"
    t.integer "division_id"
    t.string  "division_name"
    t.integer "polling_place_id"
    t.string  "polling_place"
    t.integer "candidate_id"
    t.string  "candidate_surname"
    t.string  "candidate_given_name"
    t.integer "ballot_position"
    t.boolean "elected"
    t.boolean "historic_elected"
    t.string  "party_ab"
    t.string  "party_name"
    t.integer "ordinary_votes"
    t.float   "swing"
  end

end
