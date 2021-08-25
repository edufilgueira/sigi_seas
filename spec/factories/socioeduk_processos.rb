FactoryBot.define do
  factory :socioeduk_processo, class: 'Socioeduk::Processo' do
    numero_processo { "MyString" }
    socioeduk_tipo_processo { nil }
    socioeduk_comarca { nil }
    data_representacao { "2018-09-10" }
    data_decisao { "2018-09-10" }
    numero_oficio { "MyString" }
    data_oficio { "2018-09-10" }
    socioeduk_situacao_processo { nil }
    socioeduk_municipio { nil }
    data_hora_infracao { "2018-09-10 13:22:09" }
    data_hora_apreensao { "2018-09-10 13:22:09" }
  end
end
