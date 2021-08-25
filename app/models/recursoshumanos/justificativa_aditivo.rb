class Recursoshumanos::JustificativaAditivo < ApplicationRecord
  audited
  
  has_many :recursoshumanos_aditivos
  
  def to_s
    descricao
  end
end
