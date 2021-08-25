class Socioeduk::ProcessoRecepcaoJovem < ApplicationRecord
  belongs_to :socioeduk_processo, class_name: 'Socioeduk::Processo'
  belongs_to :socioeduk_jovem_recepcao, class_name: 'Socioeduk::JovemRecepcao'

  has_one :socioeduk_processo_recepcao_jovem_infracao, class_name: 'Socioeduk::ProcessoRecepcaoJovemInfracao'
end
