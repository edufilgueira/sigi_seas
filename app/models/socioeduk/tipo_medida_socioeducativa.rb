class Socioeduk::TipoMedidaSocioeducativa < ApplicationRecord
  has_many :jovem_recepcoes
  has_many :unidade_socioeducativa_blocos
end
