FactoryBot.define do
  factory :socioeduk_pedagogico_jovem_disciplina_escolaridade, class: 'Socioeduk::PedagogicoJovemDisciplinaEscolaridade' do
    socioeduk_pedagogico_jovem nil
    socioeduk_disciplina_escolaridade nil
    socioeduk_situacao_disciplina nil
    data_conclusao "2018-09-04"
    observacao "MyText"
  end
end
