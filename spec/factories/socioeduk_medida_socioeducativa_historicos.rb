FactoryBot.define do
  factory :socioeduk_medida_socioeducativa_historico, class: 'Socioeduk::MedidaSocioeducativaHistorico' do
    socioeduk_processo { "" }
    socioeduk_tipo_medida_socioeducativa { "" }
    socioeduk_situacao_cumprimento { "" }
    socioeduk_circunstancia { "" }
    inicio { "2019-10-29" }
    fim_previsto { "2019-10-29" }
    periodo_dias { 1 }
    socioeduk_tipo_conclusao_medida_socioeducativas { "" }
    socioeduk_encaminhamento_conclusao_medida_socioeducativas { "" }
    data_conclusao { "2019-10-29" }
    observacao_conclusao { "MyText" }
    socioeduk_numero_processo { "" }
    data_sentenca_conclusao { "2019-10-29" }
    data_sentenca { "2019-10-29" }
    data_decisao { "2019-10-29" }
  end
end
