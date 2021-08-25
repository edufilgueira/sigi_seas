FactoryBot.define do
  factory :unidade_bloco_dormitorio_capacidade do
    UnidadeBlocoDormitorio { nil }
    quantidade_alteracao { 1 }
    tipo_alteracao { "MyString" }
    responsavel { "MyString" }
    usuario { 1 }
  end
end
