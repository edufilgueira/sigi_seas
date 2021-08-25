class Socioeduk::SaudeJovem < ApplicationRecord
  belongs_to :socioeduk_jovem_recepcao, class_name: 'Socioeduk::JovemRecepcao', required: false
  belongs_to :socioeduk_condicao_fisica, class_name: 'Socioeduk::CondicaoFisica', required: false
  has_one :socioeduk_jovem, through: :socioeduk_jovem_recepcao

  has_many :socioeduk_saude_jovens_substancias_utilizadas, class_name: 'Socioeduk::SaudeJovensSubstanciasUtilizada'
  has_many :socioeduk_saude_jovens_tipo_parentescos, class_name: 'Socioeduk::SaudeJovensTipoParentesco'
  has_many :socioeduk_saude_jovens_tipo_medicamento_controlados, class_name: 'Socioeduk::SaudeJovensTipoMedicamentoControlado'
  has_many :socioeduk_saude_jovens_tipo_parentesco_suicidios, class_name: 'Socioeduk::SaudeJovensTipoParentescoSuicidio'
  has_many :socioeduk_saude_jovens_tipo_parentesco_doenca_mentais, class_name: 'Socioeduk::SaudeJovensTipoParentescoDoencaMental'
  has_many :socioeduk_saude_jovem_saude_clinicas, class_name: 'Socioeduk::SaudeJovemSaudeClinica'
  has_many :socioeduk_saude_jovem_vacinas, class_name: 'Socioeduk::SaudeJovemVacina'
  has_many :socioeduk_saude_jovem_exames, class_name: 'Socioeduk::SaudeJovemExame'
  has_many :socioeduk_saude_jovem_atendimentos, class_name: 'Socioeduk::SaudeJovemAtendimento'
  has_many :socioeduk_saude_jovens_metodos_contraceptivos, class_name: 'Socioeduk::SaudeJovensMetodosContraceptivo'

  accepts_nested_attributes_for :socioeduk_saude_jovens_substancias_utilizadas, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_saude_jovens_tipo_parentescos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_saude_jovens_tipo_medicamento_controlados, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_saude_jovens_tipo_parentesco_suicidios, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_saude_jovens_tipo_parentesco_doenca_mentais, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_saude_jovem_saude_clinicas, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_saude_jovem_vacinas, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_saude_jovem_exames, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_saude_jovem_atendimentos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_saude_jovens_metodos_contraceptivos, reject_if: :all_blank, allow_destroy: true
  
end 