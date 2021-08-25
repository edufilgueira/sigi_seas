class Socioeduk::Cid < ApplicationRecord
  has_many :socioeduk_saude_jovem_saude_clinicas, class_name: 'Socioeduk::SaudeJovemSaudeClinica'
end
