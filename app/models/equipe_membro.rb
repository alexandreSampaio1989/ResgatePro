class EquipeMembro < ApplicationRecord
    self.table_name = "tb_equipe_membros"

    belongs_to :equipe, class_name: "Equipe", foreign_key: "equipe_id"
    belongs_to :funcionario, class_name: "Funcionario", foreign_key: "funcionario_id"

    validates :equipe_id, :funcionario_id, presence: true
    validates :funcionario_id, uniqueness: { scope: :equipe_id, message: "já faz parte desta equipe" }
end