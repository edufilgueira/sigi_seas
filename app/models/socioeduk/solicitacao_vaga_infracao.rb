class Socioeduk::SolicitacaoVagaInfracao < ApplicationRecord
  belongs_to :solicitacao_vaga, class_name: 'Socioeduk::SolicitacaoVaga'
  belongs_to :artigo_infracao, class_name: 'Socioeduk::ArtigoInfracao'
  belongs_to :cidade, required: false
end