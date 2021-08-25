class Socioeduk::JovemContato < ApplicationRecord
  belongs_to :socioeduk_jovem, class_name: "Socioeduk::Jovem", :foreign_key => "socioeduk_jovem_id", required: false
  belongs_to :socioeduk_tipo_contato, class_name: "Socioeduk::TipoContato", :foreign_key => "socioeduk_tipo_contato_id", required: false
end
