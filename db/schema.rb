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

ActiveRecord::Schema.define(version: 2023_03_06_124109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "agency_user_delivery_packages", force: :cascade do |t|
    t.integer "agency_user_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "shop_order_item_pricing_table_group_id"
    t.integer "delivery_agency_id"
    t.integer "vendor_id"
  end

  create_table "agency_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "delivery_agency_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "average_caches", force: :cascade do |t|
    t.bigint "rater_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "avg", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rateable_type", "rateable_id"], name: "index_average_caches_on_rateable"
    t.index ["rater_id"], name: "index_average_caches_on_rater_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", default: 0, null: false
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "total_price", precision: 6, scale: 2
    t.decimal "tax", precision: 6, scale: 2
    t.integer "payment_method_id"
    t.boolean "is_trial_order", default: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "main_field_id"
    t.integer "approval_status"
    t.integer "approved_by"
    t.integer "parent_id"
  end

  create_table "category_translations", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category_name"
    t.index ["category_id"], name: "index_category_translations_on_category_id"
    t.index ["locale"], name: "index_category_translations_on_locale"
  end

  create_table "chat_boot_messages", force: :cascade do |t|
    t.bigint "chat_boot_room_id", null: false
    t.bigint "user_id", null: false
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "send_from", default: 0
    t.index ["chat_boot_room_id"], name: "index_chat_boot_messages_on_chat_boot_room_id"
    t.index ["user_id"], name: "index_chat_boot_messages_on_user_id"
  end

  create_table "chat_boot_room_users", force: :cascade do |t|
    t.bigint "chat_boot_room_id", null: false
    t.bigint "user_id", null: false
    t.integer "role", limit: 2, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_boot_room_id"], name: "index_chat_boot_room_users_on_chat_boot_room_id"
    t.index ["role"], name: "index_chat_boot_room_users_on_role"
    t.index ["user_id"], name: "index_chat_boot_room_users_on_user_id"
  end

  create_table "chat_boot_rooms", force: :cascade do |t|
    t.string "name"
    t.integer "chat_from", null: false
    t.integer "shop_id"
    t.integer "vendor_id"
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.text "message", null: false
    t.datetime "created_at"
  end

  create_table "delivery_agencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "main_contact", null: false
    t.string "contact_phone", null: false
    t.text "contact_address", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "delivery_agency_pricing_table_calendars", force: :cascade do |t|
    t.bigint "delivery_agency_pricing_table_id", null: false
    t.string "day"
    t.time "delivery_time_from"
    t.time "delivery_time_to"
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["delivery_agency_pricing_table_id"], name: "index_pricing_table_on_calendar"
  end

  create_table "delivery_agency_pricing_tables", force: :cascade do |t|
    t.string "delivery_agency_id", null: false
    t.string "country_code", null: false
    t.string "city_code", null: false
    t.string "district"
    t.decimal "max_weight", precision: 6, scale: 2, default: "0.0", null: false
    t.decimal "max_distance", precision: 6, scale: 2, default: "0.0", null: false
    t.string "delivery_time", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "length", precision: 6, scale: 2, default: "0.0", null: false
    t.decimal "width", precision: 6, scale: 2, default: "0.0", null: false
    t.decimal "height", precision: 6, scale: 2, default: "0.0", null: false
    t.string "size_unit", default: "0", null: false
    t.string "weight_unit", default: "0", null: false
    t.string "time_unit", default: "0", null: false
  end

  create_table "delivery_agency_vendors", force: :cascade do |t|
    t.bigint "delivery_agency_id", null: false
    t.bigint "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["delivery_agency_id"], name: "index_delivery_agency_vendors_on_delivery_agency_id"
    t.index ["vendor_id"], name: "index_delivery_agency_vendors_on_vendor_id"
  end

  create_table "entries", force: :cascade do |t|
    t.string "meal_type"
    t.string "calories"
    t.integer "protiens"
    t.integer "carboh"
    t.integer "fats"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_subscriptions", force: :cascade do |t|
    t.integer "event_type", null: false
    t.integer "related_id"
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "broadcasted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.text "faq_question"
    t.text "faq_answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_vacancies", force: :cascade do |t|
    t.string "vacancy_title"
    t.string "department"
    t.string "location"
    t.text "vacancy_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_vacancy_resumes", force: :cascade do |t|
    t.integer "jobvacancy_id"
    t.integer "resume_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "letsencrypt_certificates", force: :cascade do |t|
    t.string "domain"
    t.text "certificate"
    t.text "intermediaries"
    t.text "key"
    t.datetime "expires_at"
    t.datetime "renew_after"
    t.string "verification_path"
    t.string "verification_string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["domain"], name: "index_letsencrypt_certificates_on_domain"
    t.index ["renew_after"], name: "index_letsencrypt_certificates_on_renew_after"
  end

  create_table "main_field_countries", force: :cascade do |t|
    t.string "country_code", null: false
    t.integer "main_field_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "main_field_translations", force: :cascade do |t|
    t.bigint "main_field_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "main_field_name"
    t.index ["locale"], name: "index_main_field_translations_on_locale"
    t.index ["main_field_id"], name: "index_main_field_translations_on_main_field_id"
  end

  create_table "main_fields", force: :cascade do |t|
    t.string "main_field_name"
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "option_groups", force: :cascade do |t|
    t.string "option_group_name", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vendor_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "option_name", null: false
    t.integer "option_group_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_collecting_locations", force: :cascade do |t|
    t.integer "order_item_id", null: false
    t.integer "delivery_agent_id", null: false
    t.integer "vendor_id", null: false
    t.decimal "current_address_longitude", precision: 10, scale: 6, null: false
    t.decimal "current_address_latitude", precision: 10, scale: 6, null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_delivery_locations", force: :cascade do |t|
    t.integer "delivery_agent_id", null: false
    t.integer "shop_id", null: false
    t.decimal "current_address_longitude", precision: 10, scale: 6, null: false
    t.decimal "current_address_latitude", precision: 10, scale: 6, null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order_item_id"
  end

  create_table "order_item_delivery_orders", force: :cascade do |t|
    t.integer "order_item_id", null: false
    t.integer "vendor_id", null: false
    t.integer "delivery_agent_id", null: false
    t.integer "delivery_status", null: false
    t.string "delivery_code", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "shop_id"
    t.datetime "delivery_datetime_from"
    t.datetime "delivery_datetime_to"
    t.datetime "collecting_datetime_from"
    t.datetime "collecting_datetime_to"
    t.string "collecting_code"
    t.boolean "is_checked", default: false
    t.index ["delivery_agent_id", "order_item_id", "status"], name: "order_item_delivery_order", unique: true
  end

  create_table "overall_averages", force: :cascade do |t|
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "overall_avg", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rateable_type", "rateable_id"], name: "index_overall_averages_on_rateable"
  end

  create_table "payment_method_credit_limit_per_shops", force: :cascade do |t|
    t.integer "vendor_id", null: false
    t.integer "shop_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "limit", precision: 6, scale: 2, default: "0.0", null: false
    t.index ["vendor_id", "shop_id"], name: "payment_method_credit_index", unique: true
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.integer "access", limit: 2, default: 0
    t.string "name_model"
    t.string "name_attribute"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "privacy_policies", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_offers_requests", force: :cascade do |t|
    t.integer "vendor_id", null: false
    t.integer "shop_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity", null: false
    t.integer "request_status", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id", "shop_id", "product_id"], name: "product_offers_request", unique: true
  end

  create_table "product_options", force: :cascade do |t|
    t.integer "option_id", null: false
    t.integer "product_id", null: false
    t.string "group_code", null: false
    t.decimal "product_quantity", default: "0.0"
    t.decimal "product_price", default: "0.0"
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "option_SKU"
    t.integer "option_group_id"
    t.string "product_option_code"
  end

  create_table "product_pricing_categories", force: :cascade do |t|
    t.integer "vendor_pricing_category_id", null: false
    t.integer "product_id", null: false
    t.integer "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_shipped_countries", force: :cascade do |t|
    t.integer "product_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "country_code"
  end

  create_table "product_translations", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "product_name"
    t.index ["locale"], name: "index_product_translations_on_locale"
    t.index ["product_id"], name: "index_product_translations_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "vendor_id", null: false
    t.string "product_SKU", null: false
    t.string "product_name"
    t.integer "product_total_quantity", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "product_barcode"
    t.integer "product_publish_status"
    t.integer "weight_unit", default: 0
    t.decimal "weight", default: "0.0"
    t.string "product_tags", default: ""
    t.decimal "product_price", default: "0.0"
    t.integer "product_special_tag"
    t.datetime "product_special_tag_expiration"
    t.integer "minimum_order", default: 1
    t.boolean "is_taxable", default: true
    t.boolean "is_trial_product", default: false
    t.decimal "product_trial_price", precision: 6, scale: 2, default: "0.0"
    t.integer "product_trial_quantity", default: 0
    t.decimal "product_length", precision: 6, scale: 2, default: "0.0", null: false
    t.decimal "product_width", precision: 6, scale: 2, default: "0.0", null: false
    t.decimal "product_height", precision: 6, scale: 2, default: "0.0", null: false
    t.integer "product_size_unit", limit: 2, default: 0, null: false
    t.index ["product_SKU", "vendor_id"], name: "product_sku", unique: true
  end

  create_table "quantity_pricings", force: :cascade do |t|
    t.integer "quantity_from", null: false
    t.integer "quantity_to", null: false
    t.decimal "price", precision: 6, scale: 2, default: "0.0", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "delivery_agency_pricing_table_id", null: false
    t.index ["delivery_agency_pricing_table_id"], name: "index_pricing_table_on_quantity_pricing"
  end

  create_table "rates", force: :cascade do |t|
    t.bigint "rater_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "stars", null: false
    t.string "dimension"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable"
    t.index ["rater_id"], name: "index_rates_on_rater_id"
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string "cacheable_type"
    t.bigint "cacheable_id"
    t.float "avg", null: false
    t.integer "qty", null: false
    t.string "dimension"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"
    t.index ["cacheable_type", "cacheable_id"], name: "index_rating_caches_on_cacheable"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "full_name"
    t.string "current_title"
    t.string "current_company"
    t.string "email_address"
    t.string "mobile_number"
    t.datetime "availability"
    t.text "cover_letter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "role_permissions", force: :cascade do |t|
    t.integer "permission_id"
    t.integer "role_id"
    t.integer "created_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "role_types", force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "role_type", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "shop_addresses_books", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "country_code", null: false
    t.string "city_code", null: false
    t.integer "zip_code", null: false
    t.integer "address_status", null: false
    t.text "address_details", null: false
    t.string "street_name"
    t.integer "building_number"
    t.integer "address_type", default: 0
    t.decimal "longitude", precision: 10, scale: 6, null: false
    t.decimal "latitude", precision: 10, scale: 6, null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "district", default: "", null: false
  end

  create_table "shop_categories", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "shop_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shop_global_settings", force: :cascade do |t|
    t.integer "time_zone", null: false
    t.integer "currency", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "shop_id"
  end

  create_table "shop_main_fields", force: :cascade do |t|
    t.integer "main_field_id", null: false
    t.integer "shop_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shop_order_item_credit_card_details", force: :cascade do |t|
    t.decimal "amount", precision: 6, scale: 2, default: "0.0", null: false
    t.string "currency", null: false
    t.string "card_number", null: false
    t.string "card_brand", null: false
    t.string "transaction_id", null: false
    t.string "authorization_code", null: false
    t.string "receipt_id", null: false
    t.string "stan", null: false
    t.string "terminal", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "auht_type"
    t.string "shop_order_ids"
    t.string "customer_email"
  end

  create_table "shop_order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "vendor_id", null: false
    t.decimal "product_price", precision: 6, scale: 2, null: false
    t.integer "order_item_status", default: 0
    t.integer "quantity", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "shop_payment_method_id", null: false
    t.decimal "tax", precision: 6, scale: 2
    t.decimal "shipping", precision: 6, scale: 2
    t.decimal "total_price", precision: 6, scale: 2
    t.string "pricing_category_ids"
    t.integer "shipping_method_id"
    t.boolean "is_trial_order", default: false
    t.boolean "is_stock_reset", default: false
    t.integer "stock_reset_by"
  end

  create_table "shop_order_items_pricing_tables", force: :cascade do |t|
    t.integer "shop_order_item_id", null: false
    t.integer "delivery_agency_pricing_table_id", null: false
    t.integer "quantity", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "group_id"
  end

  create_table "shop_order_statuses", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "order_status", default: 0, null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "product_id"
    t.boolean "is_trial_order", default: false
    t.text "note"
    t.integer "shop_order_item_id"
  end

  create_table "shop_orders", force: :cascade do |t|
    t.string "order_code", null: false
    t.integer "shop_id", null: false
    t.string "payment_currency", null: false
    t.integer "shop_billing_details_address_id", null: false
    t.text "order_note"
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "payment_exchange_rate", precision: 6, scale: 2
    t.decimal "order_total", precision: 6, scale: 2
    t.integer "shop_shipping_details_address_id"
    t.integer "vendor_id"
    t.string "session_id", default: ""
    t.integer "vatrenas_subscription_id"
    t.decimal "payment_conversion_fees", precision: 6, scale: 2, default: "0.0", null: false
  end

  create_table "shop_pricing_categories", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "vendor_id", null: false
    t.integer "pricing_category_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shop_translations", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "shop_name"
    t.text "shop_address"
    t.string "shop_street_name"
    t.index ["locale"], name: "index_shop_translations_on_locale"
    t.index ["shop_id"], name: "index_shop_translations_on_shop_id"
  end

  create_table "shop_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shop_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shop_vendors", force: :cascade do |t|
    t.integer "vendor_id", null: false
    t.integer "shop_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "request_status", default: 0
  end

  create_table "shop_wishlist_items", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "product_id", null: false
    t.integer "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "shop_name"
    t.string "shop_main_contact_name", null: false
    t.string "shop_mobile_number", null: false
    t.string "shop_email", null: false
    t.string "shop_domain", null: false
    t.string "shop_address"
    t.decimal "shop_address_longitude", precision: 10, scale: 6, null: false
    t.decimal "shop_address_latitude", precision: 10, scale: 6, null: false
    t.integer "shop_default_language", default: 0
    t.integer "shop_default_currency", default: 0
    t.string "shop_country_code", default: "0"
    t.string "shop_city_name", default: "0"
    t.string "shop_street_name"
    t.integer "shop_building_no", default: 0
    t.integer "shop_floor_number", default: 0
    t.integer "shop_postcode", default: 0
    t.boolean "shop_status", default: false
    t.boolean "boolean", default: false
    t.integer "shop_parent_id"
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "shop_state", default: ""
    t.string "shop_finance_department", default: ""
    t.integer "approved_status", default: 0
    t.integer "approved_updated_by"
    t.datetime "approved_updated_at"
    t.integer "approved_by"
    t.datetime "approved_at"
    t.index ["shop_email"], name: "index_shops_on_shop_email", unique: true, where: "(shop_email IS NOT NULL)"
  end

  create_table "site_languages", force: :cascade do |t|
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "language_code"
    t.string "language_flag"
    t.string "language_dir"
    t.string "language_locale"
  end

  create_table "subscription_conditions", force: :cascade do |t|
    t.integer "vatrena_subscription_id", null: false
    t.integer "condition_type_id", null: false
    t.integer "condition_from", default: 0, null: false
    t.integer "condition_to", default: 0, null: false
    t.integer "target_days", default: 0, null: false
    t.decimal "subscription_fees", precision: 6, scale: 2, default: "0.0", null: false
    t.decimal "transaction_fees", precision: 6, scale: 2, default: "0.0", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "international_transaction_fees", precision: 6, scale: 2, default: "0.0"
    t.integer "transaction_fees_type", default: 0
    t.integer "transaction_international_fees_type", default: 0
  end

  create_table "terms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "test_table", force: :cascade do |t|
    t.string "test_name", null: false
    t.integer "test_number", default: 100, null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trial_product_shops", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "shop_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.boolean "deleted", default: false
    t.datetime "deleted_at"
    t.boolean "banned", default: false
    t.datetime "banned_at"
    t.string "mobile_number"
    t.string "telephone_number"
    t.string "telephone_number_ext"
    t.integer "department_id"
    t.string "stripe_id"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.boolean "password_changed", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "vatrena_about_us_pages", force: :cascade do |t|
    t.string "page_title", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vatrena_home_page_links", force: :cascade do |t|
    t.string "link_title", null: false
    t.integer "link_order", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_main_link", default: true
  end

  create_table "vatrena_payments", force: :cascade do |t|
    t.integer "payment_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "payment_info", default: ""
  end

  create_table "vatrena_shippings", force: :cascade do |t|
    t.integer "shipping_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vatrena_strength_pages", force: :cascade do |t|
    t.string "page_title", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vatrena_subscriptions", force: :cascade do |t|
    t.string "subscription_label", null: false
    t.decimal "subscription_fees", precision: 6, scale: 2, default: "0.0", null: false
    t.decimal "transaction_fees", precision: 6, scale: 2, default: "0.0", null: false
    t.boolean "is_default", default: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "transaction_fees_type", default: 0
  end

  create_table "vatrena_taxes", force: :cascade do |t|
    t.string "country_code", null: false
    t.string "state_code", default: "0", null: false
    t.string "city_code", default: "0", null: false
    t.decimal "tax", precision: 6, scale: 2, default: "0.0", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vatrena_why_vatrena_pages", force: :cascade do |t|
    t.string "page_title", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vatrenas_currencies", force: :cascade do |t|
    t.string "currency_code", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_code", "status"], name: "index_vatrenas_currencies_on_currency_code_and_status", unique: true
  end

  create_table "vatrenas_currency_to_currencies", force: :cascade do |t|
    t.integer "vatrenas_currency_id", null: false
    t.string "currency_code", null: false
    t.decimal "exchange_rate", precision: 6, scale: 2, default: "0.0"
    t.decimal "converting_fees", precision: 6, scale: 2, default: "0.0"
    t.boolean "is_auto_update", default: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vatrenas_global_settings", force: :cascade do |t|
    t.integer "time_zone", null: false
    t.integer "currency", null: false
    t.string "domain", default: "*", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vatrenas_our_clients", force: :cascade do |t|
    t.string "client_name", null: false
    t.boolean "show_on_home_page", default: true
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vatrenas_taxes", force: :cascade do |t|
    t.string "country_code", null: false
    t.string "city_code", null: false
    t.decimal "tax", precision: 8, scale: 2, default: "0.0"
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "country_name", default: ""
    t.string "city_name", default: ""
  end

  create_table "vendor_addresses_books", force: :cascade do |t|
    t.integer "vendor_id", null: false
    t.string "country_code", null: false
    t.string "city_code", null: false
    t.integer "zip_code", null: false
    t.integer "address_status", null: false
    t.text "address_details", null: false
    t.string "street_name"
    t.integer "building_number"
    t.integer "address_type", default: 0
    t.decimal "longitude", precision: 10, scale: 6, null: false
    t.decimal "latitude", precision: 10, scale: 6, null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address_title", null: false
  end

  create_table "vendor_background_jobs", force: :cascade do |t|
    t.integer "vendor_id", null: false
    t.string "background_job_id", null: false
    t.integer "job_type", null: false
    t.integer "job_status", default: 0, null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendor_categories", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id", "category_id"], name: "index_vendor_categories_on_vendor_id_and_category_id", unique: true, where: "((vendor_id IS NOT NULL) AND (category_id IS NOT NULL))"
  end

  create_table "vendor_currencies", force: :cascade do |t|
    t.integer "vatrenas_currency_id", null: false
    t.integer "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendor_currency_to_currencies", force: :cascade do |t|
    t.integer "vatrenas_currency_to_currencies_id", null: false
    t.integer "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendor_custom_taxes", force: :cascade do |t|
    t.integer "vendor_category_id", null: false
    t.integer "vendor_id", null: false
    t.string "country_code", null: false
    t.string "city_code", null: false
    t.decimal "tax", precision: 8, scale: 2, default: "0.0"
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "country_name", default: ""
    t.string "city_name", default: ""
    t.boolean "with_products", default: false
    t.index ["vendor_category_id", "vendor_id", "country_code", "city_code", "status", "with_products"], name: "vendor_custom_taxes_index", unique: true
  end

  create_table "vendor_global_settings", force: :cascade do |t|
    t.integer "time_zone", default: 0, null: false
    t.integer "currency", default: 0, null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vendor_id"
  end

  create_table "vendor_main_fields", force: :cascade do |t|
    t.integer "main_field_id", null: false
    t.integer "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendor_payment_methods", force: :cascade do |t|
    t.integer "payment_id", null: false
    t.integer "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "payment_method_account_info"
  end

  create_table "vendor_pricing_categories", force: :cascade do |t|
    t.string "vendor_pricing_category_name", null: false
    t.integer "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_default", default: false, null: false
    t.integer "vendor_pricing_category_type"
    t.decimal "pricing_category_flat_discount"
    t.decimal "pricing_category_bonus"
    t.decimal "vendor_maximum_order"
    t.decimal "vendor_minimum_order"
    t.decimal "pricing_category_per_amount_amount"
    t.decimal "pricing_category_per_amount_amount_discount"
    t.datetime "offer_start"
    t.datetime "offer_end"
    t.integer "bonus_on_every", default: 1, null: false
  end

  create_table "vendor_products_custom_taxes", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "vendor_custom_tax_id", null: false
    t.decimal "tax", precision: 6, scale: 2, default: "0.0"
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendor_reconciliations", force: :cascade do |t|
    t.integer "vendor_id", null: false
    t.decimal "reconciliation_amount", precision: 6, scale: 2, default: "0.0", null: false
    t.integer "reconciliation_by", null: false
    t.integer "reconciliation_year", null: false
    t.integer "reconciliation_month", null: false
    t.datetime "reconciliation_start_date", null: false
    t.datetime "reconciliation_end_date", null: false
    t.decimal "total_vendor_owes", precision: 6, scale: 2, default: "0.0", null: false
    t.decimal "total_vatrenas_owes", precision: 6, scale: 2, default: "0.0", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendor_reconciliations_details", force: :cascade do |t|
    t.integer "vendor_reconciliations_id", null: false
    t.integer "shop_order_id", null: false
    t.integer "shop_id", null: false
    t.integer "vendor_id", null: false
    t.integer "vendor_subscription_id", null: false
    t.integer "subscription_percentage_type", null: false
    t.decimal "vendor_share", precision: 6, scale: 2, default: "0.0", null: false
    t.decimal "vatrenas_share", precision: 6, scale: 2, default: "0.0", null: false
    t.integer "vendor_payment_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "shop_order_item_id"
    t.decimal "shop_order_item_total_price", precision: 6, scale: 2, default: "0.0", null: false
    t.decimal "subscription_percentage_value", precision: 6, scale: 2, default: "0.0", null: false
    t.index ["shop_order_id", "shop_order_item_id", "status"], name: "vendor_reconciliation_details_index", unique: true
  end

  create_table "vendor_shipping_methods", force: :cascade do |t|
    t.integer "shipping_id", null: false
    t.integer "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendor_shops_invitations", force: :cascade do |t|
    t.integer "vendor_id", null: false
    t.string "shop_email", null: false
    t.datetime "accepted_at"
    t.integer "accepted_by_id"
    t.string "invitation_token"
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "shop_mobile"
    t.text "shop_note"
    t.index ["invitation_token"], name: "index_vendor_shops_invitations_on_invitation_token", unique: true
    t.index ["vendor_id", "shop_email"], name: "index_vendor_shops_invitations_on_vendor_id_and_shop_email", unique: true
  end

  create_table "vendor_site_languages", force: :cascade do |t|
    t.integer "language_id", null: false
    t.integer "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendor_subscription_methods", force: :cascade do |t|
    t.integer "subscription_id", null: false
    t.integer "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendor_translations", force: :cascade do |t|
    t.bigint "vendor_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "vendor_name"
    t.text "vendor_address"
    t.string "vendor_street_name"
    t.index ["locale"], name: "index_vendor_translations_on_locale"
    t.index ["vendor_id"], name: "index_vendor_translations_on_vendor_id"
  end

  create_table "vendor_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "vendor_id", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "vendor_name"
    t.string "vendor_main_contact", null: false
    t.string "vendor_mobile_number", null: false
    t.string "vendor_email", null: false
    t.string "vendor_domain", null: false
    t.string "vendor_address"
    t.integer "vendor_default_language", default: 0
    t.integer "vendor_default_currency", default: 0
    t.integer "vendor_country_id", default: 0
    t.integer "vendor_city_id", default: 0
    t.boolean "vendor_status", default: false
    t.boolean "boolean", default: false
    t.integer "vendor_parent_id"
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "vendor_address_latitude"
    t.decimal "vendor_address_longitude"
    t.string "vendor_street_name"
    t.integer "vendor_building_no"
    t.integer "vendor_floor_number"
    t.integer "vendor_postcode"
    t.string "vendor_country"
    t.string "vendor_state"
    t.string "vendor_city"
    t.string "uid"
    t.string "vendor_finance_department", default: ""
    t.integer "approved_status", default: 0
    t.integer "approved_updated_by"
    t.datetime "approved_updated_at"
    t.index ["vendor_email"], name: "index_vendors_on_vendor_email", unique: true, where: "(vendor_email IS NOT NULL)"
  end

  create_table "vendors_stripe_connects", force: :cascade do |t|
    t.integer "vendor_id", null: false
    t.string "suid", null: false
    t.string "access_token", null: false
    t.string "refresh_token", null: false
    t.string "publishable_key", null: false
    t.boolean "status", default: true
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", limit: 191, null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "chat_boot_messages", "chat_boot_rooms"
  add_foreign_key "chat_boot_messages", "users"
  add_foreign_key "chat_boot_room_users", "chat_boot_rooms"
  add_foreign_key "chat_boot_room_users", "users"
  add_foreign_key "delivery_agency_pricing_table_calendars", "delivery_agency_pricing_tables"
  add_foreign_key "delivery_agency_vendors", "delivery_agencies"
  add_foreign_key "delivery_agency_vendors", "vendors"
  add_foreign_key "permissions", "roles"
  add_foreign_key "quantity_pricings", "delivery_agency_pricing_tables"
end
