class AddColumnAtendidoToSolicitacaoPatrimonios < ActiveRecord::Migration[5.1]
  def change
    add_column :solicitacao_patrimonios, :atendido, :boolean, default: false
  end
end
