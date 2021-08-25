FactoryBot.define do
  factory :socioeduk_pedagogico_jovem_escolaridade_medida, class: 'Socioeduk::PedagogicoJovemEscolaridadeMedida' do
    socioeduk_pedagogico_jovem nil
    socioeduk_escolaridade nil
    socioeduk_tipo_local_curso nil
    escola "MyString"
    ano 1
  end
end
