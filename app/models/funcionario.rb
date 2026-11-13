class Funcionario < ApplicationRecord
    self.table_name = "tb_funcionarios"

    belongs_to :empresa, foreign_key: "empresa_id"
    has_one :cnh, foreign_key: "funcionario_id", dependent: :destroy

    # Relação de muitos para muitos via tabela intermediária
    has_many :funcionario_cargos, class_name: "FuncionarioCargo", foreign_key: "funcionario_id", dependent: :destroy
    has_many :cargos, through: :funcionario_cargos, source: :cargo
    
    validates :nm_funcionario, :cpf, presence: true
    validates :cpf, uniqueness: true

    has_one_attached :foto

    delegate :vencida?, to: :cnh, prefix: true, allow_nil: true
end