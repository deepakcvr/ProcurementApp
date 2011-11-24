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

ActiveRecord::Schema.define(:version => 20111124102301) do

  create_table "categories", :force => true do |t|
    t.string   "category_name"
    t.string   "category_description"
    t.boolean  "category_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "login_name"
    t.string   "login_password"
    t.string   "first_name"
    t.string   "company_name"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "company_website"
    t.string   "company_address1"
    t.string   "company_address2"
    t.string   "company_city"
    t.string   "company_state"
    t.integer  "company_pincode"
    t.string   "company_country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.string   "last_name"
    t.string   "contact_fax"
  end

  add_index "clients", ["contact_email"], :name => "index_clients_on_contact_email", :unique => true

  create_table "products", :force => true do |t|
    t.integer  "category_id"
    t.string   "product_name"
    t.string   "product_description"
    t.boolean  "product_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
