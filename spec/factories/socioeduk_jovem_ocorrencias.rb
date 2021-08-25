FactoryBot.define do
  factory :socioeduk_jovem_ocorrencia, class: 'Socioeduk::JovemOcorrencia' do
    socioeduk_jovem { nil }
    socioeduk_tipo_ocorrencia { nil }
    data_hora { "2018-09-12 11:05:57" }
    descricao { "MyString" }
  end
end
