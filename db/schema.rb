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

ActiveRecord::Schema.define(:version => 20110719030414) do

  create_table "labels", :force => true do |t|
    t.string   "name"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labels_tasks", :force => true do |t|
    t.integer  "task_id"
    t.integer  "label_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.text     "description"
    t.integer  "created_by"
    t.integer  "assign_to"
    t.date     "due_date"
    t.float    "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weeks", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end