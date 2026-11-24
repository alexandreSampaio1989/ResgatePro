class Viatura < ApplicationRecord
    self.table_name = "tb_viaturas"

    has_many :equipes, foreign_key: "viatura_id", dependent: :nullify

    validates :numero, :placa, :descricao_viatura, :tipo_viatura, presence: true
    validates :placa, uniqueness: true
end