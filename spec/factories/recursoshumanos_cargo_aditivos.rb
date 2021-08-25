# frozen_string_literal: true

FactoryBot.define do
  factory :recursoshumanos_cargo_aditivo, class: 'Recursoshumanos::CargoAditivo' do
    #recursoshumanos_cargo nil
    association :recursoshumanos_cargo, factory: :recursoshumanos_cargo
    #recursoshumanos_aditivo nil
    association :recursoshumanos_aditivo, factory: :recursoshumanos_aditivo
    qtd_anterior 1
    operacao "MyString"
    qtd_adicionado 1
    qtd_atual 1
  end
end
