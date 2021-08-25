class RenameColumnNumeroSolicitacaoToSolicitacaoPatrimonios < ActiveRecord::Migration[5.1]
  def change
    rename_column :solicitacao_patrimonios, :numero_solicitacao, :numero_processo
  end
end
