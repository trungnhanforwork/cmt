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

ActiveRecord::Schema[8.0].define(version: 2025_03_29_234000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.integer "priority", default: 1
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "cert_types", force: :cascade do |t|
    t.string "code", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["code"], name: "index_cert_types_on_code", unique: true
  end

  create_table "certificates", force: :cascade do |t|
    t.string "cert_number", null: false
    t.date "cert_date", null: false
    t.jsonb "products", default: []
    t.bigint "cert_type_id"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "subgroups", default: []
    t.index ["brand_id"], name: "index_certificates_on_brand_id"
    t.index ["cert_type_id"], name: "index_certificates_on_cert_type_id"
  end

  create_table "certificates_subgroups", id: false, force: :cascade do |t|
    t.bigint "certificate_id", null: false
    t.bigint "subgroup_id", null: false
    t.index ["certificate_id", "subgroup_id"], name: "index_certificates_subgroups_on_certificate_id_and_subgroup_id", unique: true
    t.index ["certificate_id"], name: "index_certificates_subgroups_on_certificate_id"
    t.index ["subgroup_id"], name: "index_certificates_subgroups_on_subgroup_id"
  end

  create_table "product_groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "subgroups", force: :cascade do |t|
    t.string "name"
    t.string "code", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_group_id", null: false
    t.index ["code"], name: "index_subgroups_on_code", unique: true
    t.index ["product_group_id"], name: "index_subgroups_on_product_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.integer "user_type", default: 0, null: false
    t.integer "integer", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["user_type"], name: "index_users_on_user_type"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "certificates", "brands"
  add_foreign_key "certificates", "cert_types"
  add_foreign_key "certificates_subgroups", "certificates"
  add_foreign_key "certificates_subgroups", "subgroups"
  add_foreign_key "sessions", "users"
  add_foreign_key "subgroups", "product_groups"
end
