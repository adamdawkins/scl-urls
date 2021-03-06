# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_04_123837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bodytypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_bodytypes_on_name", unique: true
  end

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.boolean "is_default", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_channels_on_name", unique: true
    t.index ["slug"], name: "index_channels_on_slug", unique: true
  end

  create_table "derivatives", force: :cascade do |t|
    t.string "capcode"
    t.string "name"
    t.string "slug"
    t.bigint "bodytype_id", null: false
    t.string "transmission"
    t.string "fueltype"
    t.integer "doors"
    t.bigint "model_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bodytype_id"], name: "index_derivatives_on_bodytype_id"
    t.index ["model_id"], name: "index_derivatives_on_model_id"
    t.index ["slug"], name: "index_derivatives_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_manufacturers_on_name", unique: true
    t.index ["slug"], name: "index_manufacturers_on_slug", unique: true
  end

  create_table "model_ranges", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.bigint "manufacturer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manufacturer_id"], name: "index_model_ranges_on_manufacturer_id"
    t.index ["name"], name: "index_model_ranges_on_name", unique: true
    t.index ["slug"], name: "index_model_ranges_on_slug", unique: true
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.bigint "model_range_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["model_range_id"], name: "index_models_on_model_range_id"
  end

  add_foreign_key "derivatives", "bodytypes"
  add_foreign_key "derivatives", "models"
  add_foreign_key "model_ranges", "manufacturers"
  add_foreign_key "models", "model_ranges"
end
