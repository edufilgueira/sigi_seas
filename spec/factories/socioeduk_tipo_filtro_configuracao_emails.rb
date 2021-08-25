FactoryBot.define do
  factory :socioeduk_tipo_filtro_configuracao_email, class: 'Socioeduk::TipoFiltroConfiguracaoEmail' do
    socioeduk_tipo_acao_configuracao_email { nil }
    descricao { "MyString" }
  end
end
