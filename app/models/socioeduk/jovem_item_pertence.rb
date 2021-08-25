class Socioeduk::JovemItemPertence < ApplicationRecord
  belongs_to :socioeduk_jovem_controle_pertence, class_name: 'Socioeduk::JovemControlePertence', foreign_key: 'socioeduk_jovem_controle_pertence_id', required: false
end
