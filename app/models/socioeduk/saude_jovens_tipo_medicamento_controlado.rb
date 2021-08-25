class Socioeduk::SaudeJovensTipoMedicamentoControlado < ApplicationRecord
  belongs_to :saude_jovem, class_name: 'Socioeduk::SaudeJovem'
  belongs_to :socioeduk_tipo_medicamento_controlado, class_name: 'Socioeduk::TipoMedicamentoControlado'
end
