class Socioeduk::TipoMedicamentoControlado < ApplicationRecord
  belongs_to :socioeduk_saude_jovem, required: false
end
