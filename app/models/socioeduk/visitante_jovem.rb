class Socioeduk::VisitanteJovem < ApplicationRecord
  belongs_to :socioeduk_visitante, class_name: 'Socioeduk::Visitante'
  belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem'
  belongs_to :socioeduk_tipo_parentesco, class_name: 'Socioeduk::TipoParentesco'
end
