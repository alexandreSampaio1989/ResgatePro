class Empresa < ApplicationRecord
    self.table_name = "tb_empresas"

    has_many :funcionarios, dependent: :destroy
    has_many :viaturas, dependent: :destroy
    has_many :equipes, dependent: :destroy

    validates :nm_empresa, :cnpj, presence: true, uniqueness: true
    validates :ativa, presence: true, inclusion: { in: [true, false] }
    validates :cnpj, 
                format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/, message: "deve estar no formato 00.000.000/0000-00" }, 
                uniqueness: true
end