require 'rails_helper'
require 'debug'

RSpec.describe Equipe, type: :model do
  describe "validações" do
    it "Deve ser validada com nome e contrato" do
      equipe = build(:equipe)
      expect(equipe).to be_valid
    end

    it "Não deve ser válida sem nome" do
      equipe = build(:equipe, nm_equipe: nil)
      expect(equipe).not_to be_valid
      expect(equipe.errors[:nm_equipe]).to include("não pode ficar em branco")
    end
  end

  describe "associações" do
    it "Deve estar vinculada a um contrato e possuir uma viatura" do
      empresa = create(:empresa)
      viatura = create(:viatura)
      equipe = create(:equipe, empresa: empresa, viatura: viatura)

      expect(equipe.empresa).to eq(empresa)
      expect(equipe.viatura).to eq(viatura)
    end

    it "pode ter vários colaboradores" do
      equipe = create(:equipe)
      funcionario1 = create(:funcionario, empresa: equipe.empresa)
      funcionario2 = create(:funcionario, empresa: equipe.empresa)

      equipe.funcionarios << funcionario1
      equipe.funcionarios << funcionario2

      expect(equipe.funcionarios).to include(funcionario1, funcionario2)
      expect(equipe.funcionarios.count).to eq(2)
    end
  end

  describe "escopos" do
    it "retorna apenas equipes em operação" do
      equipe_ativa = create(:equipe, fora_de_operacao: false)
      equipe_inativa = create(:equipe, fora_de_operacao: true)

      expect(Equipe.em_operacao).to include(equipe_ativa)
      expect(Equipe.em_operacao).not_to include(equipe_inativa)
    end
  end
end