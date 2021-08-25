FactoryBot.define do
  factory :socioeduk_jovem_apreensao, class: 'Socioeduk::JovemApreensao' do
    socioeduk_jovem { nil }
    antecedente_criminal { false }
    qtd_processo_anterior { 1 }
    data_hora_entrada_delegacia { "2018-09-12 15:30:59" }
    dia_delegacia { 1 }
    socioeduk_tipo_medida_socioeducativa { nil }
    socioeduk_tipo_decisao_judicial { nil }
    qtd_dia_internacao_medida { 1 }
  end
end
