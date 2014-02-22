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

ActiveRecord::Schema.define(:version => 20140222215727) do

  create_table "agencies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "caseworkers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "title"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "caseworkers", ["email"], :name => "index_caseworkers_on_email", :unique => true
  add_index "caseworkers", ["reset_password_token"], :name => "index_caseworkers_on_reset_password_token", :unique => true

  create_table "constituents", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "address"
    t.string   "cell"
    t.string   "landline"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "issue_updates", :force => true do |t|
    t.text     "note"
    t.integer  "issue_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "issue_updates", ["issue_id"], :name => "index_issue_updates_on_issue_id"

  create_table "issues", :force => true do |t|
    t.text     "description"
    t.date     "date"
    t.string   "location"
    t.integer  "priority_level_id"
    t.integer  "agency_id"
    t.integer  "status_id"
    t.integer  "caseworker_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "issues", ["agency_id"], :name => "index_issues_on_agency_id"
  add_index "issues", ["caseworker_id"], :name => "index_issues_on_caseworker_id"
  add_index "issues", ["priority_level_id"], :name => "index_issues_on_priority_level_id"
  add_index "issues", ["status_id"], :name => "index_issues_on_status_id"

  create_table "priority_levels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
