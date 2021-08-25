class Socioeduk::PedagogicoJovemDisciplinaEscolaridadeMedida < ApplicationRecord
  belongs_to :socioeduk_pedagogico_jovem, class_name: 'Socioeduk::PedagogicoJovem'
  belongs_to :socioeduk_pedagogico_jovem_escolaridade_medida, class_name: 'Socioeduk::PedagogicoJovemEscolaridadeMedida'
  belongs_to :socioeduk_escolaridade, class_name: 'Socioeduk::Escolaridade'
  belongs_to :socioeduk_situacao_disciplina, class_name: 'Socioeduk::SituacaoDisciplina'
end
