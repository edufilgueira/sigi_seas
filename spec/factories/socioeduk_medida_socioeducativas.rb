FactoryBot.define do
  factory :socioeduk_medida_socioeducativa, class: 'Socioeduk::MedidaSocioeducativa' do
    socioeduk_processo { nil }
    socioeduk_tipo_medida_socioeducativa { nil }
    socioeduk_situacao_cumprimento { nil }
    socioeduk_circunstancia { nil }
    inicio { "2019-05-16" }
    fim_previsto { "2019-05-16" }
    periodo_dias { 1 }
  end
end
