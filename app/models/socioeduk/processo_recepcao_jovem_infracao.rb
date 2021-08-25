class Socioeduk::ProcessoRecepcaoJovemInfracao < ApplicationRecord
  belongs_to :socioeduk_processo_recepcao_jovem, class_name: 'Socioeduk::ProcessoRecepcaoJovem'

  has_many :socioeduk_medida_socioeducativas, class_name: 'Socioeduk::MedidaSocioeducativa', foreign_key: "socioeduk_processo_recepcao_jovem_infracao_id"
  has_many :socioeduk_audiencias, class_name: 'Socioeduk::Audiencia', foreign_key: "socioeduk_processo_recepcao_jovem_infracao_id"

  accepts_nested_attributes_for :socioeduk_medida_socioeducativas, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_audiencias, reject_if: :all_blank, allow_destroy: true
end
