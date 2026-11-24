FactoryBot.define do
  factory :empresa, class: "Empresa" do
    sequence(:nm_empresa) { Faker::Company.unique.name }
    sequence(:cnpj) { Faker::Company.brazilian_company_number(formatted: true) }
    ativa { true }
  end

  factory :viatura, class: "Viatura" do
    sequence(:numero) { "V-01" }
    descricao_viatura { "UTI Móvel" }
    tipo_viatura { "Ambulância" }
    sequence(:placa) { Faker::Vehicle.license_plate }
  end

  factory :funcionario, class: "Funcionario" do
    association :empresa
    sequence(:nm_funcionario) { Faker::Name.name }
    cpf { Faker::IdNumber.brazilian_citizen_number(formatted: true) }
    status { true }
    dt_admissao { 5.year.ago }
  end

  factory :equipe, class: "Equipe" do
    association :empresa
    association :viatura
    sequence(:nm_equipe) { |n| "Equipe #{n}" }
    fora_de_operacao { false }
  end
end