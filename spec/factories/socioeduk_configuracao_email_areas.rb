FactoryBot.define do
  factory :socioeduk_configuracao_email_area, class: 'Socioeduk::ConfiguracaoEmailArea' do
    socioeduk_configuracao_email { "" }
    unidade_socioeducativa_area { "" }
  end
end
