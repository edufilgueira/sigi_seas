FactoryBot.define do
  factory :socioeduk_saude_jovem_ocorrencia, class: 'Socioeduk::SaudeJovemOcorrencia' do
    socioeduk_jovem_recepcao { nil }
    socioeduk_tipo_atendimento { nil }
    data { "2020-01-13" }
    observacao { "MyText" }
  end
end
