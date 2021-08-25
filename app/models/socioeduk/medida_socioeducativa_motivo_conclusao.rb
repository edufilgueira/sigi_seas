class Socioeduk::MedidaSocioeducativaMotivoConclusao < ApplicationRecord
  belongs_to :socioeduk_tipo_medida_socioeducativa, class_name: 'Socioeduk::TipoMedidaSocioeducativa'
  belongs_to :socioeduk_tipo_conclusao_medida_socioeducativa, class_name: 'Socioeduk::TipoConclusaoMedidaSocioeducativa'
end
