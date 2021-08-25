FactoryBot.define do
  factory :socioeduk_processo_recepcao_jovem_infracao, class: 'Socioeduk::ProcessoRecepcaoJovemInfracao' do
    socioeduk_processo_recepcao_jovem { nil }
    reincidente { false }
    cumpre_medida { false }
    socioeduk_medida_socioeducativa { nil }
    mandato_apreencao { false }
  end
end
