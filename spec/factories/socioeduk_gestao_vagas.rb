FactoryBot.define do
  factory :socioeduk_gestao_vaga, class: 'Socioeduk::GestaoVaga' do
    socioeduk_jovem { nil }
    unidade_socioeducativa { nil }
    usuario { nil }
    tramite { "MyString" }
    ativo { false }
  end
end
