class Socioeduk::PedagogicoJovemOficina < ApplicationRecord
  belongs_to :pedagogico_jovem, class_name: 'Socioeduk::PedagogicoJovem', foreign_key: "socioeduk_pedagogico_jovem_id"
  belongs_to :socioeduk_tipo_oficina, class_name: 'Socioeduk::TipoOficina'
end