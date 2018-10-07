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

ActiveRecord::Schema.define(version: 2018_10_05_031050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "queries", force: :cascade do |t|
    t.string "key", null: false
    t.jsonb "value", default: {}, null: false
    t.string "query"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "external_author_id"
    t.string "author"
    t.string "content"
    t.string "region"
    t.string "language"
    t.datetime "publish_date"
    t.datetime "harvested_date"
    t.integer "following"
    t.integer "followers"
    t.integer "updates"
    t.string "post_type"
    t.string "account_type"
    t.boolean "retweet"
    t.string "account_category"
    t.string "new_june_2018"
    t.string "alt_external_id"
    t.bigint "tweet_id"
    t.string "article_url"
    t.string "tco1_step1"
    t.string "tco2_step1"
    t.string "tco3_step1"
    t.integer "tweet_hour"
  end

end
