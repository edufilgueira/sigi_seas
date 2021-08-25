class Socioeduk::SaudeJovemSaudeClinica < ApplicationRecord
  belongs_to :saude_jovem, class_name: 'Socioeduk::SaudeJovem'
  belongs_to :socioeduk_cid, class_name: 'Socioeduk::Cid'
  belongs_to :socioeduk_local_tratamento, class_name: 'Socioeduk::LocalTratamento'
end
