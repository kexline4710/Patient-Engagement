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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131203192351) do

  create_table "answers", :force => true do |t|
    t.text     "content"
    t.integer  "question_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "coordinator_id"
    t.boolean  "viewed",         :default => false
  end

  create_table "coordinators", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "authenticity_token"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "trial_id"
  end


  create_table "feelings", :force => true do |t|
    t.string   "emotion"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end


  create_table "participant_files", :force => true do |t|
    t.integer  "coordinator_id"
    t.string   "subject_list_file_name"
    t.string   "subject_list_content_type"
    t.integer  "subject_list_file_size"
    t.datetime "subject_list_updated_at"
  end

  create_table "participants", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "authenticity_token"
    t.integer  "subject_number"
    t.integer  "coordinator_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "first_time_login",   :default => true
    t.string   "phone_number"
    t.integer  "feeling_id"
  end

  create_table "questions", :force => true do |t|
    t.integer  "participant_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "private",        :default => false
    t.boolean  "answered",       :default => false
  end

  create_table "trials", :force => true do |t|
    t.text     "information"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title"
    t.integer  "number"
  end

end
