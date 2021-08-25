class Socioeduk::RelatorioDiario < ApplicationRecord
  belongs_to :usuario
  belongs_to :unidade_socioeducativa
  validates_presence_of :data
end
