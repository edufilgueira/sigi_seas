class ItensSolicitacaoPatrimonio < ApplicationRecord
  belongs_to :solicitacao_patrimonio
  belongs_to :item_patrimonio
  validates :item_patrimonio_id, :quantidade_solicitada, presence: true
end
