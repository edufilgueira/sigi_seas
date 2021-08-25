class UnidadeSocioeducativaBloco < ApplicationRecord
  belongs_to :unidade_socioeducativa
  belongs_to :socioeduk_tipo_medida_socioeducativa, class_name: 'Socioeduk::TipoMedidaSocioeducativa'
  has_many :unidade_bloco_dormitorios, :dependent => :destroy
  acts_as_paranoid
end