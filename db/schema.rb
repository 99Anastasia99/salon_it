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

ActiveRecord::Schema.define(version: 2019_04_14_183718) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "masters_id"
    t.index ["masters_id"], name: "index_categories_on_masters_id"
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "average_spending", default: 0.0
    t.integer "average_visits", default: 0
    t.string "name"
    t.string "patronymic"
    t.string "surname"
    t.datetime "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "street"
    t.string "region"
    t.string "country"
    t.string "building"
    t.integer "flat"
  end

  create_table "day_of_weeks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name_of_day"
    t.bigint "master_id"
    t.index ["master_id"], name: "index_day_of_weeks_on_master_id"
  end

  create_table "masters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.string "surname"
    t.string "patronymmic"
    t.time "open_time"
    t.time "close_time"
    t.index ["category_id"], name: "index_masters_on_category_id"
  end

  create_table "offers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "price"
    t.string "name"
    t.string "description"
    t.bigint "master_id"
    t.bigint "category_id"
    t.time "duration"
    t.index ["category_id"], name: "index_offers_on_category_id"
    t.index ["master_id"], name: "index_offers_on_master_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "offer_id"
    t.string "offers_list"
    t.date "date_of_visit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price", default: 0.0
    t.bigint "master_id"
    t.index ["client_id"], name: "index_visits_on_client_id"
    t.index ["master_id"], name: "index_visits_on_master_id"
    t.index ["offer_id"], name: "index_visits_on_offer_id"
  end

  create_table "working_hours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "masters_id"
    t.time "open"
    t.time "close"
    t.bigint "master_id"
    t.bigint "day_of_week_id"
    t.index ["day_of_week_id"], name: "index_working_hours_on_day_of_week_id"
    t.index ["master_id"], name: "index_working_hours_on_master_id"
    t.index ["masters_id"], name: "index_working_hours_on_masters_id"
  end

  add_foreign_key "offers", "categories"
  add_foreign_key "offers", "masters"
  add_foreign_key "visits", "clients"
  add_foreign_key "visits", "offers"
end
