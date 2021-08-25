class Socioeduk::SaudeJovemAtendimento < ApplicationRecord
  belongs_to :saude_jovem, class_name: 'Socioeduk::SaudeJovem', required: false
  belongs_to :socioeduk_tipo_atendimento, class_name: 'Socioeduk::TipoAtendimento', required: false
  belongs_to :socioeduk_cid, class_name: 'Socioeduk::Cid', required: false
end
