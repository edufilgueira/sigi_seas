FactoryBot.define do
  factory :socioeduk_audiencia, class: 'Socioeduk::Audiencia' do
    socioeduk_processo { nil }
    socioeduk_comarca { nil }
    numero_processo { "MyString" }
    datahora { "2019-05-16 16:47:35" }
    observacao { "MyText" }
  end
end
