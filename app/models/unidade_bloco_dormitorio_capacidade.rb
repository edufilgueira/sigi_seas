class UnidadeBlocoDormitorioCapacidade < ApplicationRecord
  belongs_to :unidade_bloco_dormitorio
  belongs_to :usuario
  validates_presence_of :quantidade_alteracao, :responsavel
  acts_as_paranoid
end
