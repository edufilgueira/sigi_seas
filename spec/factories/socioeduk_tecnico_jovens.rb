FactoryBot.define do
  factory :socioeduk_tecnico_jovem, class: 'Socioeduk::TecnicoJovem' do
    socioeduk_jovem nil
    tem_filhos false
    quantos_filhos 1
    socioeduk_convivio_familiar nil
    codigo_familiar "MyString"
    cnis "MyString"
    programas_sociais false
    socioeduk_renda_familiar nil
    socioeduk_composicao_familiar nil
    socioeduk_plano_individual_atendimento nil
    nome_tecnico "MyString"
    profissional_referencia "MyString"
  end
end
