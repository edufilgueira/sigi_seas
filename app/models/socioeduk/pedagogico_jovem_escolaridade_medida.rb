class Socioeduk::PedagogicoJovemEscolaridadeMedida < ApplicationRecord
  belongs_to :pedagogico_jovem, class_name: 'Socioeduk::PedagogicoJovem'
  belongs_to :socioeduk_escolaridade, class_name: 'Socioeduk::Escolaridade'
  belongs_to :socioeduk_tipo_local_curso, class_name: 'Socioeduk::TipoLocalCurso'
end
