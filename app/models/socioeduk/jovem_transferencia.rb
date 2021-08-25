class Socioeduk::JovemTransferencia < ApplicationRecord
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem'
  belongs_to :unidade_socioeducativa
end
