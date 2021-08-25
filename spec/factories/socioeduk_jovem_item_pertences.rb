FactoryBot.define do
  factory :socioeduk_jovem_item_pertence, class: 'Socioeduk::JovemItemPertence' do
    socioeduk_jovem_controle_pertence { nil }
    nome { "MyString" }
    data_entrega { "MyString" }
    date { "MyString" }
    recebente { "MyString" }
    entregador { "MyString" }
    usuario_new { 1 }
    usuario_update { 1 }
  end
end
