class Socioeduk::TecnicoJovemFamilia < ApplicationRecord
  belongs_to :socioeduk_tecnico_jovem, class_name: 'Socioeduk::TecnicoJovem', foreign_key: "socioeduk_tecnico_jovem_id"
  belongs_to :socioeduk_escolaridade, class_name: 'Socioeduk::Escolaridade'
  belongs_to :socioeduk_tipo_parentesco, class_name: 'Socioeduk::TipoParentesco'
end
