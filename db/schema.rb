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

ActiveRecord::Schema.define(:version => 20121031093103) do

  create_table "academics", :force => true do |t|
    t.string   "qualification",   :default => "",  :null => false
    t.string   "institute",       :default => "",  :null => false
    t.float    "percentage",      :default => 0.0, :null => false
    t.integer  "year_of_passout", :default => 0,   :null => false
    t.integer  "user_id",                          :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "academics", ["institute"], :name => "index_academics_on_institute", :unique => true
  add_index "academics", ["percentage"], :name => "index_academics_on_percentage", :unique => true
  add_index "academics", ["qualification"], :name => "index_academics_on_qualification", :unique => true
  add_index "academics", ["user_id"], :name => "index_academics_on_user_id", :unique => true
  add_index "academics", ["year_of_passout"], :name => "index_academics_on_year_of_passout", :unique => true

  create_table "resumes", :force => true do |t|
    t.string   "name",          :default => "",  :null => false
    t.text     "summary"
    t.integer  "phone_number",  :default => 0,   :null => false
    t.string   "email_id",      :default => "",  :null => false
    t.string   "date_of_birth", :default => "",  :null => false
    t.float    "experience",    :default => 0.0, :null => false
    t.integer  "user_id",                        :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "resumes", ["experience"], :name => "index_resumes_on_experience", :unique => true
  add_index "resumes", ["name"], :name => "index_resumes_on_name", :unique => true
  add_index "resumes", ["user_id"], :name => "index_resumes_on_user_id", :unique => true

  create_table "skills", :force => true do |t|
    t.string   "skill_name", :default => "", :null => false
    t.integer  "user_id",                    :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "skills", ["skill_name"], :name => "index_skills_on_skill_name", :unique => true
  add_index "skills", ["user_id"], :name => "index_skills_on_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "password",               :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
