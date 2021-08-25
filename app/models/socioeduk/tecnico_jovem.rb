class Socioeduk::TecnicoJovem < ApplicationRecord
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem'
  belongs_to :socioeduk_convivio_familiar, class_name: 'Socioeduk::ConvivioFamiliar', required: false
  belongs_to :socioeduk_renda_familiar, class_name: 'Socioeduk::RendaFamiliar', required: false
  belongs_to :socioeduk_composicao_familiar, class_name: 'Socioeduk::ComposicaoFamiliar', required: false
  belongs_to :socioeduk_plano_individual_atendimento, class_name: 'Socioeduk::PlanoIndividualAtendimento', required: false

  has_many :socioeduk_tecnico_jovem_programa_sociais, class_name: 'Socioeduk::TecnicoJovemProgramaSocial'
  has_many :socioeduk_tecnico_jovem_plano_atendimentos, class_name: 'Socioeduk::TecnicoJovemPlanoAtendimento'
  has_many :socioeduk_tecnico_jovem_ultimo_relatorios, class_name: 'Socioeduk::TecnicoJovemUltimoRelatorio'
  has_many :socioeduk_tecnico_jovem_visita_familiares, class_name: 'Socioeduk::TecnicoJovemVisitaFamiliar'
  has_many :socioeduk_tecnico_jovem_familias, class_name: 'Socioeduk::TecnicoJovemFamilia', foreign_key: 'socioeduk_tecnico_jovem_id'

  accepts_nested_attributes_for :socioeduk_tecnico_jovem_programa_sociais, reject_if: :all_blank, allow_destroy: true 
  accepts_nested_attributes_for :socioeduk_tecnico_jovem_plano_atendimentos, reject_if: :all_blank, allow_destroy: true 
  accepts_nested_attributes_for :socioeduk_tecnico_jovem_ultimo_relatorios, reject_if: :all_blank, allow_destroy: true 
  accepts_nested_attributes_for :socioeduk_tecnico_jovem_visita_familiares, reject_if: :all_blank, allow_destroy: true 
  accepts_nested_attributes_for :socioeduk_tecnico_jovem_familias, reject_if: :all_blank, allow_destroy: true

end
