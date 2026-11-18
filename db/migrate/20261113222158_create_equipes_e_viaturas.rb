class CreateEquipesEViaturas < ActiveRecord::Migration[8.1]
  def change
    create_table :tb_viaturas do |t|
      #t.references :empresa, null: false, foreign_key: { to_table: :tb_empresas }
      t.string :numero, null: false
      t.string :descricao_viatura
      t.string :tipo_viatura
      t.string :placa, limit: 10, null: false, index: { unique: true }

      t.timestamps
    end

    create_table :tb_equipes do |t|
      t.references :empresa, null: false, foreign_key: { to_table: :tb_empresas }
      t.references :viatura, foreign_key: { to_table: :tb_viaturas } # Pode ser opcional se a equipe estiver sem viatura no momento
      t.string :nm_equipe, null: false
      t.boolean :fora_de_operacao, default: false, null: false

      t.timestamps
    end

    # Tabela intermediária flexível (Muitos para Muitos: Equipes <-> Funcionários)
    create_table :tb_equipe_membros do |t|
      t.references :equipe, null: false, foreign_key: { to_table: :tb_equipes }
      t.references :funcionario, null: false, foreign_key: { to_table: :tb_funcionarios }
      t.string :funcao_na_equipe # Ex: "Lider", "Socorrista", "Condutor"
      t.date :data_escala

      t.timestamps
    end
  end
end
