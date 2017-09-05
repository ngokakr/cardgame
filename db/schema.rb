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

ActiveRecord::Schema.define(version: 20170904103250) do

  create_table "carddatas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cid"
    t.integer  "atr"
    t.integer  "rea"
    t.string   "name"
    t.integer  "cost"
    t.integer  "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cardindecks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "deck_id"
    t.integer  "card_id"
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_cardindecks_on_card_id", using: :btree
    t.index ["deck_id", "card_id"], name: "index_cardindecks_on_deck_id_and_card_id", unique: true, using: :btree
    t.index ["deck_id"], name: "index_cardindecks_on_deck_id", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cid"
    t.integer  "lv",         default: 1
    t.integer  "count",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "decks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "order"], name: "index_decks_on_user_id_and_order", unique: true, using: :btree
    t.index ["user_id"], name: "index_decks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "uid"
    t.integer  "coin"
    t.integer  "dia"
    t.integer  "rate"
    t.string   "password_digest"
    t.integer  "loginDays"
    t.string   "modelchange"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "cardindecks", "cards"
  add_foreign_key "cardindecks", "decks"
  add_foreign_key "cards", "users"
  add_foreign_key "decks", "users"
end
