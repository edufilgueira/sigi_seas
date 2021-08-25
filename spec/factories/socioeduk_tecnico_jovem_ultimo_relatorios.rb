FactoryBot.define do
  factory :socioeduk_tecnico_jovem_ultimo_relatorio, class: 'Socioeduk::TecnicoJovemUltimoRelatorio' do
    socioeduk_tecnico_jovem nil
    socioeduk_sugestao_relatorio nil
    data_inclusao "2018-09-04"
    socioeduk_tipo_retorno nil
    unidade_socioeducativa_inclusao_id 1
  end
end
