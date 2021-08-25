class Socioeduk::TipoSinal < ApplicationRecord
  has_many :jovem_caracteristicas, class_name: 'Socioeduk::JovemCaracteristica', foreign_key: "socioeduk_tipo_sinal_id"
end
