FactoryBot.define do
  factory :socioeduk_jovem_documento, class: 'Socioeduk::JovemDocumento' do
    socioeduk_jovem { nil }
    socioeduk_tipo_documento { nil }
    numero { "MyString" }
    data_emissao { "2018-11-28" }
    origem_documento { 1 }
    destino_documento { 1 }
  end
end
