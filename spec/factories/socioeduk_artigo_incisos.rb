FactoryBot.define do
  factory :socioeduk_artigo_inciso, class: 'Socioeduk::ArtigoInciso' do
    socioeduk_artigo_paragrafo { nil }
    descricao { "MyString" }
  end
end
