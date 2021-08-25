FactoryBot.define do
  factory :socioeduk_pedagogico_jovem_profissionalizante, class: 'Socioeduk::PedagogicoJovemProfissionalizante' do
    socioeduk_pedagogico_jovem nil
    socioeduk_tipo_local_curso nil
    nome_programa "MyString"
    socioeduk_tipo_curso nil
    nome_curso "MyString"
    data_inicio "2018-09-04"
    data_fim "2018-09-04"
    carga_horaria "MyString"
    observacao "MyText"
  end
end
