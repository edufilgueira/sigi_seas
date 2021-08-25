class Socioeduk::SaudeJovensParentesViciado < ApplicationRecord
  belongs_to :socioeduk_saude_jovens
  belongs_to :socioeduk_tipo_parentesco
  belongs_to :socioeduk_entorpecente
end
