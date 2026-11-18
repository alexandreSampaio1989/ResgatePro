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

ActiveRecord::Schema[8.1].define(version: 2026_11_13_222158) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "tb_cargos", force: :cascade do |t|
    t.string "nm_cargo", null: false
    t.string "tipo_cargo", default: "administrativo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nm_cargo"], name: "index_tb_cargos_on_nm_cargo", unique: true
  end

  create_table "tb_cnhs", force: :cascade do |t|
    t.bigint "funcionario_id", null: false
    t.string "numero"
    t.string "categoria"
    t.date "data_vencimento"
    t.boolean "de_acordo_com_a_norma", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcionario_id"], name: "index_tb_cnhs_on_funcionario_id", unique: true
  end

  create_table "tb_empresas", force: :cascade do |t|
    t.string "nome", null: false
    t.string "cnpj", null: false
    t.boolean "ativa", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnpj"], name: "index_tb_empresas_on_cnpj", unique: true
  end

  create_table "tb_equipe_membros", force: :cascade do |t|
    t.bigint "equipe_id", null: false
    t.bigint "funcionario_id", null: false
    t.string "funcao_na_equipe"
    t.date "data_escala"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipe_id"], name: "index_tb_equipe_membros_on_equipe_id"
    t.index ["funcionario_id"], name: "index_tb_equipe_membros_on_funcionario_id"
  end

  create_table "tb_equipes", force: :cascade do |t|
    t.bigint "empresa_id", null: false
    t.bigint "viatura_id"
    t.string "nm_equipe", null: false
    t.boolean "fora_de_operacao", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_tb_equipes_on_empresa_id"
    t.index ["viatura_id"], name: "index_tb_equipes_on_viatura_id"
  end

  create_table "tb_funcionario_cargos", force: :cascade do |t|
    t.bigint "funcionario_id", null: false
    t.bigint "cargo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cargo_id"], name: "index_tb_funcionario_cargos_on_cargo_id"
    t.index ["funcionario_id"], name: "index_tb_funcionario_cargos_on_funcionario_id"
  end

  create_table "tb_funcionarios", force: :cascade do |t|
    t.bigint "empresa_id", null: false
    t.string "nome", null: false
    t.string "cpf", null: false
    t.boolean "status", default: true, null: false
    t.date "dt_admissao"
    t.date "dt_demissao"
    t.date "dt_aniversario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_tb_funcionarios_on_cpf", unique: true
    t.index ["empresa_id"], name: "index_tb_funcionarios_on_empresa_id"
  end

  create_table "tb_viaturas", force: :cascade do |t|
    t.string "numero", null: false
    t.string "descricao_viatura"
    t.string "tipo_viatura"
    t.string "placa", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["placa"], name: "index_tb_viaturas_on_placa", unique: true
  end

  add_foreign_key "tb_cnhs", "tb_funcionarios", column: "funcionario_id"
  add_foreign_key "tb_equipe_membros", "tb_equipes", column: "equipe_id"
  add_foreign_key "tb_equipe_membros", "tb_funcionarios", column: "funcionario_id"
  add_foreign_key "tb_equipes", "tb_empresas", column: "empresa_id"
  add_foreign_key "tb_equipes", "tb_viaturas", column: "viatura_id"
  add_foreign_key "tb_funcionario_cargos", "tb_cargos", column: "cargo_id"
  add_foreign_key "tb_funcionario_cargos", "tb_funcionarios", column: "funcionario_id"
  add_foreign_key "tb_funcionarios", "tb_empresas", column: "empresa_id"
end
