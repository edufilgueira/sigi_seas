class Socioeduk::TipoParentesco < ApplicationRecord
  has_many :socioeduk_saude_jovens_tipo_parentescos, class_name: 'Socioeduk::SaudeJovensTipoParentesco'
end
