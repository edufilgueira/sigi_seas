class UnidadeSocioeducativaArea < ApplicationRecord
  belongs_to :unidade_socioeducativa
  belongs_to :area
  #validates_uniqueness_of :unidade_socioeducativa_id, :area_id, message: 'já possui esta área para a unidade'
end
