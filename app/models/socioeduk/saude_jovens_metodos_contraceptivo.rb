class Socioeduk::SaudeJovensMetodosContraceptivo < ApplicationRecord
  belongs_to :socioeduk_saude_jovem, class_name: 'Socioeduk::SaudeJovem', required: false
  belongs_to :socioeduk_metodo_contraceptivo, class_name: 'Socioeduk::MetodoContraceptivo', required: false
end
