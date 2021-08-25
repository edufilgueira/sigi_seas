FactoryBot.define do
  factory :socioeduk_configuracao_email, class: 'Socioeduk::ConfiguracaoEmail' do
    socioeduk_tipo_acao_configuracao_email { nil }
    socioeduk_tipo_filtro_configuracao_email { nil }
    descricao { "MyString" }
    valor { "MyString" }
  end
end
