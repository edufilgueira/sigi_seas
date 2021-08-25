FactoryBot.define do
  factory :socioeduk_tecnico_jovem_visita_familiar, class: 'Socioeduk::TecnicoJovemVisitaFamiliar' do
    socioeduk_tecnico_jovem nil
    data_visita "2018-09-04"
    pessoa_visitada "MyString"
    finalidade_visita "MyText"
    responsavel_realizacao "MyString"
  end
end
