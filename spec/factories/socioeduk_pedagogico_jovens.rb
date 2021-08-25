FactoryBot.define do
  factory :socioeduk_pedagogico_jovem, class: 'Socioeduk::PedagogicoJovem' do
    socioeduk_jovem nil
    socioeduk_tipo_alfabetizado nil
    socioeduk_situacao_escolar nil
    socioeduk_escolaridade nil
    ultima_escola_frequentada "MyString"
    ultimo_ano_escolar 1
    cgm "MyString"
    socioeduk_situacao_ocupacional_anterior 1
    socioeduk_situacao_ocupacional_atual 1
  end
end
