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

ActiveRecord::Schema.define(version: 2020_03_06_191902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acoes", force: :cascade do |t|
    t.string "descricao_acao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ativos", force: :cascade do |t|
    t.string "descricao_ativo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "chamados" because of following StandardError
#   Unknown type 'time(6) with time zone' for column 'hora_chamado'

  create_table "setores", force: :cascade do |t|
    t.string "nome", limit: 70, null: false
    t.string "sigla", limit: 3
    t.integer "ramal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status", force: :cascade do |t|
    t.string "descricao_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tecnicos", force: :cascade do |t|
    t.bigint "usuario_id"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_tecnicos_on_usuario_id"
  end

  create_table "tipos", force: :cascade do |t|
    t.string "descricao_tipo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome", limit: 100, null: false
    t.string "sobrenome", null: false
    t.string "celular", limit: 14
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "setor_id"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["setor_id"], name: "index_usuarios_on_setor_id"
  end

  add_foreign_key "chamados", "acoes"
  add_foreign_key "chamados", "ativos"
  add_foreign_key "chamados", "setores"
  add_foreign_key "chamados", "status"
  add_foreign_key "chamados", "tecnicos"
  add_foreign_key "chamados", "tipos"
  add_foreign_key "chamados", "usuarios"
  add_foreign_key "tecnicos", "usuarios"
  add_foreign_key "usuarios", "setores"
end
