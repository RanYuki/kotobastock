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

ActiveRecord::Schema.define(version: 2018_08_21_072545) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.string "kana", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kana"], name: "index_authors_on_kana"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "contact_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concept_sentences", force: :cascade do |t|
    t.integer "concept_id"
    t.integer "sentence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concept_id"], name: "index_concept_sentences_on_concept_id"
    t.index ["sentence_id"], name: "index_concept_sentences_on_sentence_id"
  end

  create_table "concepts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_concepts_on_name"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sentence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sentence_id"], name: "index_favorites_on_sentence_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "folder_sentences", force: :cascade do |t|
    t.integer "folder_id_id"
    t.integer "sentence_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folder_id_id"], name: "index_folder_sentences_on_folder_id_id"
    t.index ["sentence_id_id"], name: "index_folder_sentences_on_sentence_id_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
    t.index ["following_id"], name: "index_relationships_on_following_id"
  end

  create_table "sentences", force: :cascade do |t|
    t.integer "term_id", null: false
    t.integer "source_id", null: false
    t.string "url", null: false
    t.text "body", null: false
    t.integer "favorite_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favorite_count"], name: "index_sentences_on_favorite_count"
  end

  create_table "sources", force: :cascade do |t|
    t.integer "author_id"
    t.integer "sentence_id"
    t.string "title", null: false
    t.string "kana", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.index ["author_id"], name: "index_sources_on_author_id"
    t.index ["kana"], name: "index_sources_on_kana"
    t.index ["sentence_id"], name: "index_sources_on_sentence_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "terms", force: :cascade do |t|
    t.string "word", null: false
    t.string "kana", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kana"], name: "index_terms_on_kana"
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
    t.string "name", default: "おためし名無し", null: false
    t.integer "gender", default: 0, null: false
    t.text "profile"
    t.string "picture"
    t.datetime "leave_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end