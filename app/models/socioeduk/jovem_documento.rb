class Socioeduk::JovemDocumento < ApplicationRecord
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem', :foreign_key => "socioeduk_jovem_id", required: false
  belongs_to :socioeduk_tipo_documento, class_name: 'Socioeduk::TipoDocumento', :foreign_key => "socioeduk_tipo_documento_id", required: false
end
