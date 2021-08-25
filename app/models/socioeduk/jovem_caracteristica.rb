class Socioeduk::JovemCaracteristica < ApplicationRecord
  belongs_to :socioeduk_jovem, class_name: "Socioeduk::Jovem", :foreign_key => "socioeduk_jovem_id", required: false
  belongs_to :socioeduk_tipo_sinal, class_name: "Socioeduk::TipoSinal", :foreign_key => "socioeduk_tipo_sinal_id", required: false
end
