# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2017_03_21_125706) do

  create_table "site_nodes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["sort"], name: "index_site_nodes_on_sort"
  end

  create_table "sites", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "site_node_id"
    t.string "name", null: false
    t.string "url", null: false
    t.string "desc"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["site_node_id", "deleted_at"], name: "index_sites_on_site_node_id_and_deleted_at"
    t.index ["site_node_id"], name: "index_sites_on_site_node_id"
    t.index ["url"], name: "index_sites_on_url"
  end

end
