FactoryBot.define do
  factory :unidade_bloco_dormitorio do
    unidade_socioeducativa_blocos { nil }
    descricao { "MyString" }
    capacidade_base { 1 }
  end
end
