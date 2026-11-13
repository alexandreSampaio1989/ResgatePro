class CreateOrganizacaoEFuncionarios < ActiveRecord::Migration[8.1]
  def change
    create_table :organizacao_e_funcionarios do |t|
      t.timestamps
    end
  end
end
