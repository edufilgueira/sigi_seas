FactoryBot.define do
  factory :socioeduk_visitante, class: 'Socioeduk::Visitante' do
    nome { "MyString" }
    socioeduk_jovem { nil }
    socioeduk_tipo_documento { nil }
    numero { "MyString" }
    uf_documento { 1 }
    foto { "MyString" }
    observação { "MyText" }
    anexo { "MyString" }
  end
end
