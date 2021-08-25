class Socioeduk::PedagogicoJovemDisciplinaEscolaridade < ApplicationRecord
  belongs_to :pedagogico_jovem, class_name: 'Socioeduk::PedagogicoJovem'
  belongs_to :socioeduk_disciplina_escolaridade, class_name: 'Socioeduk::DisciplinaEscolaridade'
  belongs_to :socioeduk_situacao_disciplina, class_name: 'Socioeduk::SituacaoDisciplina'
end
