class Socioeduk::SaudeJovensSubstanciasUtilizada < ApplicationRecord
  validates_presence_of :socioeduk_entorpecente_id 
  belongs_to :socioeduk_saude_jovem, class_name: 'Socioeduk::SaudeJovem', required: false
  belongs_to :socioeduk_entorpecente, class_name: 'Socioeduk::Entorpecente', required: false
  belongs_to :socioeduk_tipo_auto_consideracao, class_name: 'Socioeduk::TipoAutoConsideracao', required: false
  belongs_to :socioeduk_tipo_tratamento, class_name: 'Socioeduk::TipoTratamento', required: false
end
