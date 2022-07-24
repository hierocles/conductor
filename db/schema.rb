# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_09_211318) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "nations", primary_key: "name", id: :string, force: :cascade do |t|
    t.string "type"
    t.string "fullname"
    t.string "motto"
    t.string "category"
    t.string "unstatus"
    t.text "endorsements", default: [], array: true
    t.integer "issues_answered"
    t.jsonb "freedom", default: {}
    t.string "region"
    t.integer "population"
    t.integer "tax"
    t.string "animal"
    t.string "currency"
    t.string "demonym"
    t.string "demonym2"
    t.string "demonym2plural"
    t.string "flag"
    t.string "majorindustry"
    t.string "govtpriority"
    t.jsonb "govt", default: {}
    t.string "founded"
    t.integer "firstlogin"
    t.integer "lastlogin"
    t.string "lastactivity"
    t.string "influence"
    t.jsonb "freedomscores", default: {}
    t.integer "publicsector"
    t.jsonb "deaths", default: {}
    t.string "leader"
    t.string "capital"
    t.string "religion"
    t.integer "factbooks"
    t.integer "dispatches"
    t.integer "dbid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "inheritance"
    t.index ["name"], name: "index_nations_on_name", unique: true
    t.index ["region"], name: "index_nations_on_region"
    t.index ["unstatus"], name: "index_nations_on_unstatus"
  end

  create_table "regions", primary_key: "name", id: :string, force: :cascade do |t|
    t.text "factbook"
    t.integer "numnations"
    t.text "nations", default: [], array: true
    t.string "delegate"
    t.integer "delegatevotes"
    t.string "delegateauth"
    t.string "founder"
    t.string "founderauth"
    t.jsonb "officers", default: {}
    t.string "power"
    t.string "flag"
    t.integer "banner"
    t.jsonb "embassies", default: {}
    t.integer "lastupdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_regions_on_name", unique: true
  end

end
