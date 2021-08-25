class Socioeduk::MedidaSocioeducativa < ApplicationRecord
  belongs_to :socioeduk_processo, class_name: 'Socioeduk::Processo'
  belongs_to :socioeduk_tipo_medida_socioeducativa, class_name: 'Socioeduk::TipoMedidaSocioeducativa'
  belongs_to :socioeduk_situacao_cumprimento, class_name: 'Socioeduk::SituacaoCumprimento'
  #belongs_to :socioeduk_circunstancia, class_name: 'Socioeduk::Circunstancia'
  #belongs_to :socioeduk_tipo_conclusao_medida_socioeducativas, class_name: 'Socioeduk::TipoConclusaoMedidaSocioeducativa', required: false
  belongs_to :socioeduk_medida_socioeducativa_motivo_conclusao, class_name: 'Socioeduk::MedidaSocioeducativaMotivoConclusao', required: false
  belongs_to :socioeduk_encaminhamento_conclusao_medida_socioeducativas, class_name: 'Socioeduk::EncaminhamentoConclusaoMedidaSocioeducativa', required: false
  belongs_to :socioeduk_numero_processo, class_name: 'Socioeduk::NumeroProcesso', required: false

  acts_as_paranoid
end
