class Equipe < ApplicationRecord
    self.table_name = "tb_equipes"

    belongs_to :empresa
    belongs_to :viatura, optional: true

    # Relação limpa de muitos para muitos com os funcionários
    has_many :equipe_membros, class_name: "EquipeMembro", foreign_key: "equipe_id", dependent: :destroy
    has_many :funcionarios, through: :equipe_membros, source: :funcionario

    validates :nm_equipe, presence: { message: "não pode ficar em branco" } 
    validates :nm_equipe, uniqueness: { scope: :empresa_id, message: "já existe"}

    # Escopos úteis para o dia a dia da operação
    scope :em_operacao, -> { where(fora_de_operacao: false) }
end