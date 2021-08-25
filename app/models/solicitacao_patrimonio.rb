class SolicitacaoPatrimonio < ApplicationRecord
  has_many :itens_solicitacao_patrimonios, dependent: :delete_all
  belongs_to :usuario_solicitante, class_name: "Usuario", foreign_key: "solicitante"
  accepts_nested_attributes_for :itens_solicitacao_patrimonios, reject_if: :all_blank, allow_destroy: true
  validates :justificativa, presence: true

  def self.gerar_numero_solicitacao
    if self.last.nil?
      numero = 1
    else
      numero = self.last.numero_solicitacao.to_i + 1
    end

    return numero
  end
end
