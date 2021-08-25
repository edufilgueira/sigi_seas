class Socioeduk::SaudeJovemVacina < ApplicationRecord
  belongs_to :saude_jovem, class_name: 'Socioeduk::SaudeJovem'
  belongs_to :socioeduk_tipo_vacina, class_name: 'Socioeduk::TipoVacina'
end