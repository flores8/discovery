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

ActiveRecord::Schema.define(:version => 20160426043651) do

  create_table "discovery_answers", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "question"
    t.integer  "user_id"
  end

  create_table "discovery_career_contentments", :force => true do |t|
    t.text     "body"
    t.integer  "personality_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "discovery_career_contentments", ["personality_id"], :name => "index_discovery_career_contentments_on_personality_id"

  create_table "discovery_categories", :force => true do |t|
    t.string   "name"
    t.integer  "personality_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "discovery_categories", ["personality_id"], :name => "index_discovery_categories_on_personality_id"

  create_table "discovery_major_recommendations", :force => true do |t|
    t.integer  "major_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "discovery_personalities", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "discovery_personalities", ["name"], :name => "index_discovery_personalities_on_name"

  create_table "discovery_questions", :force => true do |t|
    t.string   "question"
    t.string   "option_1"
    t.string   "option_2"
    t.string   "personality_type"
    t.string   "option_1_value"
    t.string   "option_2_value"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "question_type"
  end

  add_index "discovery_questions", ["question_type"], :name => "index_discovery_questions_on_question_type"

  create_table "discovery_strengths", :force => true do |t|
    t.text     "body"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "personality_id"
  end

  add_index "discovery_strengths", ["personality_id"], :name => "index_discovery_strengths_on_personality_id"

end
