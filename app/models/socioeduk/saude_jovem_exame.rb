class Socioeduk::SaudeJovemExame < ApplicationRecord
  belongs_to :saude_jovem, class_name: 'Socioeduk::SaudeJovem'
  belongs_to :socioeduk_tipo_exame, class_name: 'Socioeduk::TipoExame'
end
