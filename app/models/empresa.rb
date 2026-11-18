class Empresa < ApplicationRecord
    self.table_name = "tb_empresas"

    has_many :funcionarios, foreign_key: "empresa_id", dependent: :destroy
    has_many :viaturas, foreign_key: "tb_empresa_id", dependent: :destroy
    has_many :equipes, foreign_key: "tb_empresa_id", dependent: :destroy

    validates :nm_empresa, :cnpj, :ativa, presence: true, uniqueness: true
    validates :cnpj, uniqueness: true
end