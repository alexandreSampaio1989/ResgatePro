class Cargo < ApplicationRecord
    self.table_name = "tb_cargos"

    has_many :funcionario_cargos, class_name: "FuncionarioCargo", dependent: :destroy
    has_many :funcionarios, through: :funcionario_cargos, source: :funcionario

    validates :nm_cargo, presence: true, uniqueness: true

    enum :tipo_cargo, {
        administrativo: "administrativo",
        medico: "medico",
        enfermeiro: "enfermeiro",
        condutor: "condutor",
        condutor_socorrista: "condutor_socorrista",
        brigadista: "brigadista",
        bombeiro_civil: "bombeiro_civil",
        marinheiro: "marinheiro"
    }, default: :administrativo
end