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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "date_mentions", primary_key: "date_mention_id", id: :serial, force: :cascade do |t|
    t.date "date"
    t.integer "users"
    t.integer "ticker_id"
    t.integer "mentions"
    t.integer "estimated_outreach"
  end

  create_table "tickers", primary_key: "ticker_id", id: :serial, force: :cascade do |t|
    t.string "ticker_name", limit: 20
  end

  create_table "users", primary_key: "twitter_id", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "follower_count"
    t.date "updated_last"
  end

end
