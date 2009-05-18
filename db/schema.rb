# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090515020234) do

  create_table "project_memberships", :force => true do |t|
    t.date     "joined",     :null => false
    t.date     "leaved"
    t.integer  "user_id",    :null => false
    t.integer  "project_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_memberships", ["user_id", "project_id"], :name => "index_project_memberships_on_user_id_and_project_id", :unique => true

  create_table "projects", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["name"], :name => "index_projects_on_name", :unique => true

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "summary_reports", :force => true do |t|
    t.integer  "project_id"
    t.integer  "task_type_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_types", :force => true do |t|
    t.string   "name",       :limit => 50, :null => false
    t.integer  "project_id",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "task_types", ["project_id", "name"], :name => "index_task_types_on_project_id_and_name", :unique => true

  create_table "time_logs", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.integer  "task_type_id", :null => false
    t.text     "description"
    t.date     "task_date",    :null => false
    t.time     "worked_hours", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
