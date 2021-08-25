FactoryBot.define do
  factory :socioeduk_jovem_controle_pertence, class: 'Socioeduk::JovemControlePertence' do
    socioeduk_jovem_recepcao { nil }
    nome { "MyString" }
    data_entrega { "2020-03-30" }
    recebente { "MyString" }
    entregador { "MyString" }
    usuario_new { 1 }
    usuario_update { 1 }
  end
end
