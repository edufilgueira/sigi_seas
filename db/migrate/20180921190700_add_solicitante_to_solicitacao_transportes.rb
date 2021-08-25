class AddSolicitanteToSolicitacaoTransportes < ActiveRecord::Migration[5.1]
  def change
    add_column :solicitacao_transportes, :solicitante, :integer
  end
end
