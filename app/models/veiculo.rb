# Classe de veiculos para a aplicacao de transporte
class Veiculo < ApplicationRecord
  belongs_to :modelos_marca
  belongs_to :tipo_de_combustivel, required: false

  scope :ativos, -> { where(status: 'ativos') }
  scope :em_manutencao, -> { where(status: 'manutencao') }
  scope :ocupado, -> { where(status: 'ocupado') }
  scope :externo, -> { where(status: 'externo') }
  scope :disponiveis, -> { where(status: 'disponiveis') }

  validates :placa, uniqueness: { case_sensitive: false }
  
  def to_s
    "#{modelos_marca.modelo} - #{placa}"
  end

  def self.atualizar_status_disponivel
    # if ((Time.now.strftime('%H:%M')) == '23:50')
      Veiculo.where(status:'ativos').update_all(status: 'disponiveis')
    # end 
  end  
end
