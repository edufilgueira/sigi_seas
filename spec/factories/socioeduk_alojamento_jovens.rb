FactoryBot.define do
  factory :socioeduk_alojamento_jovem, class: 'Socioeduk::AlojamentoJovem' do
    socioeduk_jovem { nil }
    unidade_socioeducativa { nil }
    socioeduk_bloco { nil }
    socioeduk_quarto { nil }
    tamanho_roupa { "MyString" }
    tamanho_cacaldo { "MyString" }
    numero_kit { "MyString" }
  end
end
