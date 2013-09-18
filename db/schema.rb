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

ActiveRecord::Schema.define(version: 20130915191200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "body",       null: false
    t.integer  "user_id",    null: false
    t.integer  "workout_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercise_sets", force: true do |t|
    t.integer  "reps",        null: false
    t.decimal  "weight"
    t.integer  "superset_id", null: false
    t.integer  "exercise_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supersets", force: true do |t|
    t.integer  "sets",                      null: false
    t.integer  "sets_complete", default: 0, null: false
    t.integer  "workout_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                            null: false
    t.string   "email",                               null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_photo"
    t.string   "account_privacy", default: "private", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workouts", force: true do |t|
    t.date     "workout_date", null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
