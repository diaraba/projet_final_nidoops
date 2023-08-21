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

ActiveRecord::Schema.define(version: 2023_08_15_202807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abonnements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "structure_id", null: false
    t.index ["structure_id"], name: "index_abonnements_on_structure_id"
    t.index ["user_id"], name: "index_abonnements_on_user_id"
  end

  create_table "accueils", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activites", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "activites_structures", force: :cascade do |t|
    t.bigint "structure_id", null: false
    t.bigint "activite_id", null: false
    t.index ["activite_id"], name: "index_activites_structures_on_activite_id"
    t.index ["structure_id"], name: "index_activites_structures_on_structure_id"
  end

  create_table "activites_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "activite_id", null: false
    t.index ["activite_id"], name: "index_activites_users_on_activite_id"
    t.index ["user_id"], name: "index_activites_users_on_user_id"
  end

  create_table "annonce_comments", force: :cascade do |t|
    t.string "description"
    t.bigint "annonce_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["annonce_id"], name: "index_annonce_comments_on_annonce_id"
    t.index ["user_id"], name: "index_annonce_comments_on_user_id"
  end

  create_table "annonces", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "description", default: "", null: false
    t.string "purpose", default: "", null: false
    t.bigint "structure_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["structure_id"], name: "index_annonces_on_structure_id"
  end

  create_table "avis_offre_comments", force: :cascade do |t|
    t.string "description"
    t.bigint "avis_offre_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["avis_offre_id"], name: "index_avis_offre_comments_on_avis_offre_id"
    t.index ["user_id"], name: "index_avis_offre_comments_on_user_id"
  end

  create_table "avis_offres", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "description", default: "", null: false
    t.string "purpose", default: "", null: false
    t.string "condition", default: "", null: false
    t.bigint "structure_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["structure_id"], name: "index_avis_offres_on_structure_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notification_structures", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.boolean "statut", default: false, null: false
    t.string "description", default: "", null: false
    t.bigint "structure_id", null: false
    t.bigint "annonce_id", null: false
    t.bigint "avis_offre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["annonce_id"], name: "index_notification_structures_on_annonce_id"
    t.index ["avis_offre_id"], name: "index_notification_structures_on_avis_offre_id"
    t.index ["structure_id"], name: "index_notification_structures_on_structure_id"
  end

  create_table "notification_users", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.boolean "statut", default: false, null: false
    t.string "description", default: "", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_notification_users_on_user_id"
  end

  create_table "profile_structures", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "localisation", default: "", null: false
    t.string "slogan", default: "", null: false
    t.string "numero", default: "", null: false
    t.string "email", default: "", null: false
    t.bigint "structure_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "statut"
    t.index ["structure_id"], name: "index_profile_structures_on_structure_id"
  end

  create_table "profile_users", force: :cascade do |t|
    t.string "nom", default: "", null: false
    t.string "prenom", default: "", null: false
    t.string "genre", default: "", null: false
    t.string "situation", default: "", null: false
    t.string "numero", default: "", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profile_users_on_user_id"
  end

  create_table "structures", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "alias", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_structures_on_confirmation_token", unique: true
    t.index ["email"], name: "index_structures_on_email", unique: true
    t.index ["reset_password_token"], name: "index_structures_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "abonnements", "structures"
  add_foreign_key "abonnements", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activites_structures", "activites"
  add_foreign_key "activites_structures", "structures"
  add_foreign_key "activites_users", "activites"
  add_foreign_key "activites_users", "users"
  add_foreign_key "annonce_comments", "annonces"
  add_foreign_key "annonce_comments", "users"
  add_foreign_key "annonces", "structures"
  add_foreign_key "avis_offre_comments", "avis_offres"
  add_foreign_key "avis_offre_comments", "users"
  add_foreign_key "avis_offres", "structures"
  add_foreign_key "notification_structures", "annonces"
  add_foreign_key "notification_structures", "avis_offres"
  add_foreign_key "notification_structures", "structures"
  add_foreign_key "notification_users", "users"
  add_foreign_key "profile_structures", "structures"
  add_foreign_key "profile_users", "users"
end
