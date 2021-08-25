FactoryBot.define do
  factory :recursoshumanos_aditivo, class: 'Recursoshumanos::Aditivo' do
    #recursoshumanos_contrato nil
    association :recursoshumanos_contrato, factory: :recursoshumanos_contrato
    #recursoshumanos_justificativa_aditivo nil
    association :recursoshumanos_justificativa_aditivo, factory: :recursoshumanos_justificativa_aditivo
    numero_processo "MyString"
    descricao "MyString"
    data "2018-08-17"
  end
end
