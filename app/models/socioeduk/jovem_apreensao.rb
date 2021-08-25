class Socioeduk::JovemApreensao < ApplicationRecord
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem',required: false
  belongs_to :socioeduk_tipo_medida_socioeducativa, class_name: 'Socioeduk::TipoMedidaSocioeducativa',required: false
  belongs_to :socioeduk_tipo_decisao_judicial, class_name: 'Socioeduk::TipoDecisaoJudicial',required: false
end
