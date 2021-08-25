class Socioeduk::PedagogicoJovem < ApplicationRecord
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem'
  belongs_to :socioeduk_tipo_alfabetizado, class_name: 'Socioeduk::TipoAlfabetizado', required: false
  belongs_to :socioeduk_situacao_escolar, class_name: 'Socioeduk::SituacaoEscolar', required: false
  belongs_to :socioeduk_escolaridade, class_name: 'Socioeduk::Escolaridade', required: false

  has_many :socioeduk_pedagogico_jovem_disciplina_escolaridades, class_name: 'Socioeduk::PedagogicoJovemDisciplinaEscolaridade'
  has_many :socioeduk_pedagogico_jovem_escolaridade_medidas, class_name: 'Socioeduk::PedagogicoJovemEscolaridadeMedida'
  has_many :socioeduk_pedagogico_jovem_oficinas, class_name: 'Socioeduk::PedagogicoJovemOficina', foreign_key: "socioeduk_pedagogico_jovem_id"
  has_many :socioeduk_pedagogico_jovem_profissionalizantes, class_name: 'Socioeduk::PedagogicoJovemProfissionalizante', foreign_key: "socioeduk_pedagogico_jovem_id"

  accepts_nested_attributes_for :socioeduk_pedagogico_jovem_disciplina_escolaridades, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_pedagogico_jovem_escolaridade_medidas, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_pedagogico_jovem_oficinas, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_pedagogico_jovem_profissionalizantes, reject_if:  :all_blank, allow_destroy: true
end