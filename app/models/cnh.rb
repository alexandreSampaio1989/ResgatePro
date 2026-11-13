class Cnh < ApplicationRecord
    self.table_name = "tb_cnhs"

    belongs_to :funcionario, foreign_key: "funcionario_id"

    validates :numero, :categoria, :data_vencimento, presence: true
    validates :numero, uniqueness: true

    def vencida?
        data_vencimento.present? && data_vencimento < Date.current
    end
end