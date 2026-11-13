class CreateOrganizacaoEFuncionarios < ActiveRecord::Migration[8.1]
  def change
    create_table :tb_empresas do |t|
      t.string :nome, null: false
      t.string :cnpj, null: false, index: { unique: true }
      t.boolean :ativa, default: true, null: false

      t.timestamps
    end

    create_table :tb_funcionarios do |t|
      t.references :empresa, null: false, foreign_key: { to_table: :tb_empresas }
      t.string :nome, null: false
      t.string :cpf, null: false, index: { unique: true }
      t.boolean :status, default: true, null: false
      
      t.date :dt_admissao
      t.date :dt_demissao
      t.date :dt_aniversario

      t.timestamps
    end

    create_table :tb_cnhs do |t|
      t.references :funcionario, null: false, foreign_key: { to_table: :tb_funcionarios }, index: { unique: true }
      t.string :numero
      t.string :categoria
      t.date :data_vencimento
      t.boolean :de_acordo_com_a_norma, default: false

      t.timestamps
    end

    create_table :tb_cargos do |t|
      t.string :nm_cargo, null: false, index: { unique: true }
      t.string :tipo_cargo, null: false, default: "administrativo"
      t.timestamps
    end
    
    # Tabela intermediária para a relação muitos-para-muitos
    create_table :tb_funcionario_cargos do |t|
      t.references :funcionario, null: false, foreign_key: { to_table: :tb_funcionarios }
      t.references :cargo, null: false, foreign_key: { to_table: :tb_cargos }
      t.timestamps
    end
  end
end