FactoryBot.define do
  factory :socioeduk_artigo_paragrafo, class: 'Socioeduk::ArtigoParagrafo' do
    socioeduk_artigo_infracao { nil }
    descricao { "MyString" }
  end
end
