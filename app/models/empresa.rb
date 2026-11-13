class Empresa < ApplicationRecord
    self.table_name = "tb_empresas"

    has_many :funcionarios, foreign_key: "empresa_id", dependent: :destroy

    validates :nm_empresa, presence: true, uniqueness: true
end