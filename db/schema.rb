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

ActiveRecord::Schema.define(version: 20190219035030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "acount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nameaccount"
    t.string "typemoney"
  end

  create_table "carousels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pic_file_name"
    t.string "pic_content_type"
    t.integer "pic_file_size"
    t.datetime "pic_updated_at"
    t.boolean "pic_type"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_variant_id"
    t.string "role"
    t.index ["order_id"], name: "index_carts_on_order_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.integer "phone"
    t.string "mail"
    t.integer "ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "count"
    t.string "nameinvoice"
    t.integer "cellphone"
    t.integer "cellwsp"
    t.string "nit"
    t.string "role"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "address"
    t.string "phone"
    t.string "email"
    t.string "facebook"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lat"
    t.string "long"
    t.text "about"
    t.text "mission"
    t.text "vision"
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "destination_id"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "typedelivery"
    t.string "address"
    t.integer "phone"
    t.string "shipping"
    t.float "costmin"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "cash"
  end

  create_table "extras", force: :cascade do |t|
    t.string "name"
    t.text "services"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "banner_file_name"
    t.string "banner_content_type"
    t.integer "banner_file_size"
    t.datetime "banner_updated_at"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "country"
    t.string "city"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
  end

  create_table "measures", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "phone"
    t.integer "cellphone"
    t.integer "cellwsp"
    t.string "address"
    t.string "lat"
    t.string "long"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "orderdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.string "state"
    t.string "typepay"
    t.string "typedelivery"
    t.string "image"
    t.text "comment"
    t.float "total"
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer "userid"
    t.string "office"
    t.float "cost"
    t.integer "deliveryid"
  end

  create_table "product_variants", force: :cascade do |t|
    t.string "size"
    t.float "price"
    t.integer "product_id"
    t.string "description"
    t.string "code"
    t.boolean "available"
    t.float "offerprice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "wholesaleprice"
    t.float "specialistprice"
    t.float "importerprice"
    t.float "weight"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "code"
    t.bigint "measure_id"
    t.bigint "provider_id"
    t.bigint "manufacturer_id"
    t.bigint "category_id"
    t.bigint "subcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean "offer"
    t.string "details_file_name"
    t.string "details_content_type"
    t.integer "details_file_size"
    t.datetime "details_updated_at"
    t.string "picture2_file_name"
    t.string "picture2_content_type"
    t.integer "picture2_file_size"
    t.datetime "picture2_updated_at"
    t.string "picture3_file_name"
    t.string "picture3_content_type"
    t.integer "picture3_file_size"
    t.datetime "picture3_updated_at"
    t.string "picture4_file_name"
    t.string "picture4_content_type"
    t.integer "picture4_file_size"
    t.datetime "picture4_updated_at"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["manufacturer_id"], name: "index_products_on_manufacturer_id"
    t.index ["measure_id"], name: "index_products_on_measure_id"
    t.index ["provider_id"], name: "index_products_on_provider_id"
    t.index ["subcategory_id"], name: "index_products_on_subcategory_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "country"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sold_products", force: :cascade do |t|
    t.integer "product_variant_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total"
    t.integer "total_sold"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "product_id"
    t.integer "product_variant_id"
    t.integer "quantity"
    t.integer "limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "docu_file_name"
    t.string "docu_content_type"
    t.integer "docu_file_size"
    t.datetime "docu_updated_at"
    t.string "description"
    t.string "videolink"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "ci"
    t.integer "phone"
    t.text "address"
    t.string "nit"
    t.string "role"
    t.boolean "state"
    t.string "image"
    t.integer "cellphone"
    t.integer "cellwsp"
    t.string "namecompany"
    t.string "imageci"
    t.string "nameinvoice"
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "orders"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "manufacturers"
  add_foreign_key "products", "measures"
  add_foreign_key "products", "providers"
  add_foreign_key "products", "subcategories"
  add_foreign_key "subcategories", "categories"
end
