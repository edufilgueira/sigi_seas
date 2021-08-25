class Socioeduk::JovemOcorrencia < ApplicationRecord
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem'
  belongs_to :socioeduk_tipo_ocorrencia, class_name: 'Socioeduk::TipoOcorrencia'
  belongs_to :socioeduk_ocorrencia, class_name: "socioeduk_ocorrencia"
end
