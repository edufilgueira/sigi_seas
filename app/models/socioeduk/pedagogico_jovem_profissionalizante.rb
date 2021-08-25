class Socioeduk::PedagogicoJovemProfissionalizante < ApplicationRecord
  belongs_to :socioeduk_pedagogico_jovem, class_name: 'Socioeduk::PedagogicoJovem', required: false
  belongs_to :socioeduk_tipo_local_curso, class_name: 'Socioeduk::TipoLocalCurso', required: false
  belongs_to :socioeduk_tipo_curso,  class_name: 'Socioeduk::TipoCurso', required: false
end
