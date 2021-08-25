FactoryBot.define do
  factory :socioeduk_artigo_alinea, class: 'Socioeduk::ArtigoAlinea' do
    socioeduk_artigo_inciso { nil }
    descricao { "MyString" }
  end
end
