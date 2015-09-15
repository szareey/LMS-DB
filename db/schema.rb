# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150915205048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "question_id"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "teacher_comment"
    t.integer  "score"
    t.boolean  "request_meeting",               default: false
    t.string   "final_answer_img_file_name"
    t.string   "final_answer_img_content_type"
    t.integer  "final_answer_img_file_size"
    t.datetime "final_answer_img_updated_at"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "ministry_specific_id"
    t.integer  "teacher_id"
    t.string   "lesson"
    t.string   "title"
    t.string   "difficulty"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
    t.string   "homework"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons_ministry_doc_specifics", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "specific_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons_ministry_doc_specifics", ["lesson_id"], name: "index_lessons_ministry_doc_specifics_on_lesson_id", using: :btree
  add_index "lessons_ministry_doc_specifics", ["specific_id"], name: "index_lessons_ministry_doc_specifics_on_specific_id", using: :btree

  create_table "ministry_doc_courses", force: :cascade do |t|
    t.integer  "ministry_doc_id"
    t.string   "grade"
    t.string   "title"
    t.string   "description"
    t.string   "code"
    t.string   "pre_req"
    t.string   "level"
    t.string   "credit_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_doc_courses", ["ministry_doc_id"], name: "index_ministry_doc_courses_on_ministry_doc_id", using: :btree

  create_table "ministry_doc_overalls", force: :cascade do |t|
    t.integer  "strand_id"
    t.string   "part"
    t.string   "description"
    t.string   "shorthand"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_doc_overalls", ["strand_id"], name: "index_ministry_doc_overalls_on_strand_id", using: :btree

  create_table "ministry_doc_specifics", force: :cascade do |t|
    t.integer  "overall_id"
    t.string   "part"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_doc_specifics", ["overall_id"], name: "index_ministry_doc_specifics_on_overall_id", using: :btree

  create_table "ministry_doc_specifics_questions", force: :cascade do |t|
    t.integer  "specific_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_doc_specifics_questions", ["question_id"], name: "index_ministry_doc_specifics_questions_on_question_id", using: :btree
  add_index "ministry_doc_specifics_questions", ["specific_id"], name: "index_ministry_doc_specifics_questions_on_specific_id", using: :btree

  create_table "ministry_doc_strands", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "part"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_doc_strands", ["course_id"], name: "index_ministry_doc_strands_on_course_id", using: :btree

  create_table "ministry_docs", force: :cascade do |t|
    t.string   "subject"
    t.boolean  "grade9"
    t.boolean  "grade10"
    t.boolean  "grade11"
    t.boolean  "grade12"
    t.string   "province"
    t.string   "year"
    t.string   "title"
    t.string   "URLpdf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_temp_images", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "teacher_id"
    t.string   "question_file_name"
    t.string   "question_content_type"
    t.integer  "question_file_size"
    t.datetime "question_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "marks"
    t.boolean  "knowledge",             default: false
    t.boolean  "thinking",              default: false
    t.boolean  "communication",         default: false
    t.boolean  "application",           default: false
    t.boolean  "answer_has_audio",      default: false
    t.boolean  "question_has_audio",    default: false
    t.string   "description"
  end

  create_table "user_tokens", force: :cascade do |t|
    t.string   "token"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.integer  "user_id"
  end

  add_index "user_tokens", ["user_id"], name: "index_user_tokens_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.string   "gid"
    t.boolean  "is_approved"
    t.boolean  "is_admin"
  end

end
