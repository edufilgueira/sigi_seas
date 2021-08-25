FactoryBot.define do
  factory :socioeduk_processo_advogado, class: 'Socioeduk::ProcessoAdvogado' do
    socioeduk_processo { nil }
    nome { "MyString" }
    numero { "MyString" }
    uf_oab { 1 }
    defensor_publico { false }
    unidade_socioeducativa { nil }
  end
end
