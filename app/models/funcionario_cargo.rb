class FuncionarioCargo < ApplicationRecord
    self.table_name = "tb_funcionario_cargos"

    belongs_to :funcionario, class_name: "Funcionario", foreign_key: "funcionario_id"
    belongs_to :cargo, class_name: "Cargo", foreign_key: "cargo_id"

    validates :funcionario_id, :cargo_id, presence: true
end