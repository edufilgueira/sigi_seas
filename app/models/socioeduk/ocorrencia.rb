class Socioeduk::Ocorrencia < ApplicationRecord
  belongs_to :socioeduk_tipo_ocorrencia, class_name: 'Socioeduk::TipoOcorrencia'
end
