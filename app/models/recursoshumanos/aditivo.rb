class Recursoshumanos::Aditivo < ApplicationRecord
  audited
  
  belongs_to :recursoshumanos_contrato, class_name: 'Recursoshumanos::Contrato', required: false
  belongs_to :recursoshumanos_justificativa_aditivo, class_name: 'Recursoshumanos::JustificativaAditivo', required: false
  has_many :recursoshumanos_cargo_aditivos, class_name: 'Recursoshumanos::CargoAditivo'

  validates :recursoshumanos_contrato, :recursoshumanos_justificativa_aditivo, :numero_processo, :data, :descricao, :anexo, presence: true
  
  has_attached_file :anexo
  validates_attachment_content_type :anexo, content_type: ["application/pdf"]

  def to_s
    descricao + ' - ' + recursoshumanos_justificativa_aditivo.to_s + ' (' + numero_processo + ')'
  end
end
