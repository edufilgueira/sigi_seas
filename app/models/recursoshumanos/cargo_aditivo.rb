class Recursoshumanos::CargoAditivo < ApplicationRecord
  audited
  
  validates_presence_of :recursoshumanos_aditivo_id, :operacao, :qtd_adicionado

  belongs_to :recursoshumanos_cargo, class_name: 'Recursoshumanos::Cargo', foreign_key: 'recursoshumanos_cargo_id', required: false
  belongs_to :recursoshumanos_aditivo, class_name: 'Recursoshumanos::Aditivo', required: false
end
