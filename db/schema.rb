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

ActiveRecord::Schema[7.0].define(version: 2022_06_10_051152) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "Author_id"
    t.bigint "Post_id"
    t.text "Text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Author_id"], name: "index_comments_on_Author_id"
    t.index ["Post_id"], name: "index_comments_on_Post_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "Author_id"
    t.bigint "Post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Author_id"], name: "index_likes_on_Author_id"
    t.index ["Post_id"], name: "index_likes_on_Post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "Author_id"
    t.string "Title"
    t.text "Text"
    t.integer "CommentsCounter"
    t.integer "LikesCounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Author_id"], name: "index_posts_on_Author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "Photo"
    t.string "Bio"
    t.bigint "PostsCounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "posts", column: "Post_id"
  add_foreign_key "comments", "users", column: "Author_id"
  add_foreign_key "likes", "posts", column: "Post_id"
  add_foreign_key "likes", "users", column: "Author_id"
  add_foreign_key "posts", "users", column: "Author_id"
end
