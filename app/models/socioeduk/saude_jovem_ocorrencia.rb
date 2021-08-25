class Socioeduk::SaudeJovemOcorrencia < ApplicationRecord
  belongs_to :socioeduk_jovem_recepcao, class_name: 'Socioeduk::JovemRecepcao', foreign_key: 'socioeduk_jovem_recepcao_id', required: false
  belongs_to :socioeduk_tipo_atendimento, class_name: 'Socioeduk::TipoAtendimento', foreign_key: 'socioeduk_tipo_atendimento_id', required: false
end
