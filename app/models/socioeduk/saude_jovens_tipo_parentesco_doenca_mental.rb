class Socioeduk::SaudeJovensTipoParentescoDoencaMental < ApplicationRecord
  belongs_to :saude_jovem, class_name: 'Socioeduk::SaudeJovem'
  belongs_to :socioeduk_tipo_parentesco, class_name: 'Socioeduk::TipoParentesco'
end
