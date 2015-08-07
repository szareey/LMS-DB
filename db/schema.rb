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

ActiveRecord::Schema.define(version: 20150806204753) do

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
    t.integer  "ministry_specific_id"
    t.integer  "user_id"
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

  create_table "lessons_ministry_specifics", force: true do |t|
    t.integer  "lesson_id"
    t.integer  "ministry_specific_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons_ministry_specifics", ["lesson_id"], name: "index_lessons_ministry_specifics_on_lesson_id"
  add_index "lessons_ministry_specifics", ["ministry_specific_id"], name: "index_lessons_ministry_specifics_on_ministry_specific_id"

  create_table "ministry_courses", force: true do |t|
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

  add_index "ministry_courses", ["ministry_doc_id"], name: "index_ministry_courses_on_ministry_doc_id"

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
    t.integer  "ministry_strand_id"
    t.string   "part"
    t.string   "description"
    t.string   "shorthand"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_overalls", ["ministry_strand_id"], name: "index_ministry_overalls_on_ministry_strand_id"

  create_table "ministry_specifics", force: true do |t|
    t.integer  "ministry_overall_id"
    t.string   "part"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_specifics", ["ministry_overall_id"], name: "index_ministry_specifics_on_ministry_overall_id"

  create_table "ministry_specifics_questions", force: true do |t|
    t.integer  "ministry_specific_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_specifics_questions", ["ministry_specific_id"], name: "index_ministry_specifics_questions_on_ministry_specific_id"
  add_index "ministry_specifics_questions", ["question_id"], name: "index_ministry_specifics_questions_on_question_id"

  create_table "ministry_strands", force: true do |t|
    t.integer  "ministry_course_id"
    t.string   "part"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ministry_strands", ["ministry_course_id"], name: "index_ministry_strands_on_ministry_course_id"

  create_table "questions", force: true do |t|
    t.integer  "user_id"
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
