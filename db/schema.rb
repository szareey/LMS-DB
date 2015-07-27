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

ActiveRecord::Schema.define(version: 20150726192126) do

  create_table "answers", force: true do |t|
    t.integer  "user_id"
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

  create_table "lessons", force: true do |t|
    t.integer  "ministrySpecifics_id"
    t.integer  "users_id"
    t.string   "lesson"
    t.string   "difficulty"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
    t.string   "homework"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons_ministry_specifics", force: true do |t|
    t.integer  "lessons_id"
    t.integer  "ministry_specifics_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons_ministry_specifics", ["lessons_id"], name: "index_lessons_ministry_specifics_on_lessons_id"
  add_index "lessons_ministry_specifics", ["ministry_specifics_id"], name: "index_lessons_ministry_specifics_on_ministry_specifics_id"

  create_table "ministry_courses", force: true do |t|
    t.integer  "ministry_docs_id"
    t.string   "grade"
    t.string   "title"
    t.string   "description"
    t.string   "code"
    t.string   "preReq"
    t.string   "level"
    t.string   "creditValue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_courses", ["ministry_docs_id"], name: "index_ministry_courses_on_ministry_docs_id"

  create_table "ministry_docs", force: true do |t|
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

  create_table "ministry_overalls", force: true do |t|
    t.integer  "ministry_strands_id"
    t.string   "part"
    t.string   "description"
    t.string   "shorthand"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_overalls", ["ministry_strands_id"], name: "index_ministry_overalls_on_ministry_strands_id"

  create_table "ministry_specifics", force: true do |t|
    t.integer  "ministry_overalls_id"
    t.string   "part"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_specifics", ["ministry_overalls_id"], name: "index_ministry_specifics_on_ministry_overalls_id"

  create_table "ministry_specifics_questions", force: true do |t|
    t.integer  "ministry_specifics_id"
    t.integer  "questions_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_specifics_questions", ["ministry_specifics_id"], name: "index_ministry_specifics_questions_on_ministry_specifics_id"
  add_index "ministry_specifics_questions", ["questions_id"], name: "index_ministry_specifics_questions_on_questions_id"

  create_table "ministry_strands", force: true do |t|
    t.integer  "ministry_courses_id"
    t.string   "part"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_strands", ["ministry_courses_id"], name: "index_ministry_strands_on_ministry_courses_id"

  create_table "questions", force: true do |t|
    t.integer  "user_id"
    t.string   "question_file_name"
    t.string   "question_content_type"
    t.integer  "question_file_size"
    t.datetime "question_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "marks"
    t.integer  "ministrySpecifics_id"
    t.boolean  "knowledge",             default: false
    t.boolean  "thinking",              default: false
    t.boolean  "communication",         default: false
    t.boolean  "application",           default: false
    t.boolean  "answerRequiresAudio",   default: false
    t.boolean  "questionRequiresAudio", default: false
  end

  add_index "questions", ["ministrySpecifics_id"], name: "index_questions_on_ministrySpecifics_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
